package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"time"

	"github.com/garyburd/redigo/redis"
)

type bookList struct {
	Name      string `json:"name"`
	Time      string `json:"time"`
	StartAddr string `json:"startAddr"`
	EndAddr   string `json:"endAddr"`
	Number    string `json:"number"`
}
type successCode struct {
	Success string `json:"success"`
}

func handleReceiveData(w http.ResponseWriter, r *http.Request) {
	//允许跨域请求
	allowCROS(w)

	// 连接数据库
	var conn, err = redis.Dial("tcp", "127.0.0.1:6379")
	if err != nil {
		fmt.Println("数据库连接失败")
	}
	defer conn.Close()

	defer r.Body.Close()
	data, _ := ioutil.ReadAll(r.Body) //获取post的数据
	var user bookList
	json.Unmarshal(data, &user)
	fmt.Println("data:", string(data))
	conn.Do("lpush", "booklist", string(data))
	var success = successCode{
		Success: "200",
	}
	var successjson, _ = json.Marshal(success)
	time.Sleep(time.Second * 1)
	fmt.Fprintln(w, string(successjson))
}

func handleGetData(w http.ResponseWriter, r *http.Request) {
	allowCROS(w)
	conn, err := redis.Dial("tcp", "127.0.0.1:6379")
	if err != nil {
		fmt.Println("连接数据库失败")
	}
	var data, _ = redis.ByteSlices(conn.Do("lrange", "booklist", 0, -1))

	var strSlice = make([]string, 0)
	for _, v := range data {
		var v2 bookList
		json.Unmarshal(v, &v2)
		var res, _ = json.Marshal(v2)
		strSlice = append(strSlice, string(res))
	}
	var res2, _ = json.Marshal(strSlice)
	fmt.Fprintln(w, string(res2))
}

func allowCROS(w http.ResponseWriter) {
	// return
	w.Header().Set("Access-Control-Allow-Origin", "*")             //允许访问所有域
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type") //header的类型
	w.Header().Set("content-type", "application/json")             //返回数据格式是json
}

func main() {
	http.HandleFunc("/postData", handleReceiveData)
	http.HandleFunc("/getData", handleGetData)
	http.ListenAndServe("0.0.0.0:8080", nil)
}
