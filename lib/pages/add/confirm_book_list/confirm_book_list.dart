import 'dart:convert';

import "package:flutter/material.dart";
import '../../.././main.dart';
import "../../../api/get_data.dart";
import 'package:dio/dio.dart';

// 时间
// 出发地
// 目的地
// 希望人数


class ConfirmBookList extends StatelessWidget {
  final Map info;
  ConfirmBookList(this.info);
  Widget _item(String title, String desc) {
    return Card(
      // color: Colors.lightGreen[50],
      margin: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
      child: ListTile(
        leading: Container(
          alignment: Alignment.centerRight,
          width: 75,
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
        title: Text(desc),
      ),
    );
  }

  postData(url, params,BuildContext context) async {
    // await request("https://www.easy-mock.com/mock/5db8ed7be75ad470035b2d05/example").then((val) {
    //   print(val);
    // });
    Dio dio = new Dio();
    // // response=await dio.post("/test",data:{"id":12,"name":"wendu"})
    // // Response response = await dio.post(url, data:{"id":12,"name":"wendu"});
    // Response response = await dio.get("https://www.easy-mock.com/mock/5db8ed7be75ad470035b2d05/example");
    // print(response.data);
    // FormData formData = new FormData.from({
    //   "name": "wendux",
    //   "age": 25,
    //   });
    // var  response = await dio.get("http://172.18.111.1:8000/api/interships/position/19");
    // var  response = await dio.get("https://c.y.qq.com/musichall/fcgi-bin/fcg_yqqhomepagerecommend.fcg?_=1566353715246&g_tk=5381&uin=0&format=json&inCharset=utf-8&outCharset=utf-8&notice=0&platform=h5&needNewCode=1");
    this.info["name"] = "霍小叶";
    var response =
        await dio.post("http://10.130.7.36:8080/postData", data: this.info);
    // Response response = await dio.post("http://10.130.7.36:8080/postData", data:{"id":12,"name":"wendu"});
    print("========");
    var response2 = jsonDecode(response.toString());
    print(response2["success"] == "200");
    if (response2["success"] == "200") {
      print(response2);
      print("====");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => new App()));
          // this.s
    }
  }
  @override
  Widget build(BuildContext context) {
    print(this.info["abc"]);
    return Scaffold(
      appBar: AppBar(
        title: Text("确认订单"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50, left: 5, right: 5),
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            // color: Colors.blue
            ),
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  this.info["time"] == null || this.info["time"] == ""
                      ? Container()
                      : _item("时间：", this.info["time"]),
                  this.info["startAddr"] == null || this.info["startAddr"] == ""
                      ? Container()
                      : _item("出发地：", this.info["startAddr"]),
                  this.info["endAddr"] == null || this.info["endAddr"] == ""
                      ? Container()
                      : _item("目的地：", this.info["endAddr"]),
                  this.info["number"] == null || this.info["number"] == ""
                      ? Container()
                      : _item("人数：", this.info["number"]),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            showDialog(
                                // 传入 context
                                context: context,
                                // 构建 Dialog 的视图
                                builder: (_) => Material(
                                      type: MaterialType.transparency,
                                      child: new Center(
                                        child: new SizedBox(
                                          width: 120.0,
                                          height: 120.0,
                                          child: new Container(
                                            decoration: ShapeDecoration(
                                              color: Color(0xffffffff),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                new CircularProgressIndicator(),
                                                new Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 20.0,
                                                  ),
                                                  child: new Text(
                                                    "loading",
                                                    style: new TextStyle(
                                                        fontSize: 12.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                            // 确认发布点击事件
                            // print(this.info);
                            postData("http://127.0.0.1:8080/post", this.info,context);
                            // var res =
                            //     request("http://127.0.0.1:8080", this.info);
                            // print(res);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new App()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            alignment: Alignment.center,
                            height: 40,
                            child: Text(
                              "确认发布",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            // margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            alignment: Alignment.center,
                            height: 40,
                            child: Text("修改订单"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



