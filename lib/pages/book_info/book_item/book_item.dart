import "package:flutter/material.dart";

class BookItem extends StatelessWidget {
  Widget _desc(String title, String desc) {
    return Container(
      height: 30,
      // child: Text(title),
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            width: 120,
            child: Text(title + " : "),
          ),
          Container(
            child: Text(desc),
          )
        ],
      ),
    );
  }

  Widget _item(data, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // 头像
                    margin: EdgeInsets.only(top: 15, left: 45, bottom: 10),
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(width: 1, color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          "http://img3.duitang.com/uploads/item/201507/23/20150723115018_ma428.thumb.700_0.jpeg"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: Text("确认拼单"),
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text("您确定要进行和" + data["name"] + "拼单吗"),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: Colors.green,
                                            child: Text("确认"),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: Colors.grey,
                                            child: Text("取消"),
                                          ),
                                         
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: Text("我要拼单"),
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
            _desc("发起人", data["name"]),
            Divider(),
            _desc("时间", data["time"]),
            Divider(),
            _desc("出发地点", data["startAddr"]),
            Divider(),
            _desc("目的地", data["endAddr"]),
            Divider(),
            _desc("人数", data["number"]),
          ],
        ),
      ),
    );
  }

  List<Map> info;
  BookItem(this.info);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.info.map((data) => _item(data, context)).toList(),
    );
    // Container(
    //     child: ListView(
    //   children: this.info.map((data) => _item(data)).toList(),
    // ));
  }
}
