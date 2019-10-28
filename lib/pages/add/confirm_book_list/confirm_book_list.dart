import "package:flutter/material.dart";
import '../../.././main.dart';

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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new App()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            alignment: Alignment.center,
                            height: 40,
                            child: Text("确认发布",style: TextStyle(color: Colors.white),),
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
                              border: Border.all(width: 1,color: Colors.grey),
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
