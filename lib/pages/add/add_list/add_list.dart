import 'package:flutter/material.dart';
import '../confirm_book_list/confirm_book_list.dart';

class AddList extends StatefulWidget {
  bool isShow;
  AddList(this.isShow);
  @override
  _AddListState createState() => _AddListState();
}

// 时间
// 出发地
// 目的地
// 希望人数
class _AddListState extends State<AddList> {
  String time;
  String startAddr;
  String endAddr;
  String number;
  Map info = {};
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 30, right: 30),
      child: ListView(
        children: <Widget>[
          widget.isShow ? Container( // 时间
            margin: EdgeInsets.only(bottom: 8),
            child: TextField(
              onChanged: (newValue) {
                this.time = newValue;
                this.info["time"] = newValue;
              },
              // keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                suffix: Container(
                  child: Icon(Icons.timer),
                ),
                labelText: '时间',
                helperText: "请输入您的出发时间。例：2019-10-01 08:00",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // hintText: "fdasssss",
                // border: Border.lerp(a, b, t)
              ),
            ),
          ) : Container(),
          Container( // 出发地
            margin: EdgeInsets.only(bottom: 8),
            child: TextField(
              onChanged: (newValue) {
                this.startAddr = newValue;
                this.info["startAddr"] = newValue;
              },
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                suffix: Container(
                  child: Icon(Icons.timer),
                ),
                labelText: '出发地',
                helperText: "请输入您的出发地。例：交大西门",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // hintText: "fdasssss",
                // border: Border.lerp(a, b, t)
              ),
            ),
          ),
          Container( // 目的地
            margin: EdgeInsets.only(bottom: 8),
            child: TextField(
              onChanged: (newValue) {
                this.endAddr = newValue;
                this.info["endAddr"] = newValue;
              },
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                suffix: Container(
                  child: Icon(Icons.timer),
                ),
                labelText: '目的地',
                helperText: "请输入您的目的地。例：威海威高广场",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // hintText: "fdasssss",
                // border: Border.lerp(a, b, t)
              ),
            ),
          ),
          widget.isShow ? Container( //期望人数
            margin: EdgeInsets.only(bottom: 8),
            child: TextField(
              onChanged: (newValue) {
                this.number = newValue;
                this.info["number"] = newValue;
              },
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                suffix: Container(
                  child: Icon(Icons.timer),
                ),
                labelText: '人数',
                helperText: "请输入您的拼车人数。例：2/4",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.yellow),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // hintText: "fdasssss",
                // border: Border.lerp(a, b, t)
              ),
            ),
          ) : Container(),
          InkWell( // 发布订单按钮
            onTap: (){
              Map info = this.info;
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>new ConfirmBookList(info)));
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25),
              width: 50,
              height: 60,
              child: Text("发布订单",style: TextStyle(
                color: Colors.white,
                fontSize: 28
              ),),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [Colors.blue,Colors.green,Colors.blue]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
