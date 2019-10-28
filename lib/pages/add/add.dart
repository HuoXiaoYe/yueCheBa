import "package:flutter/material.dart";
import './add_list/add_list.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _title(String str) {
    return Text(
      str,
      style: TextStyle(fontSize: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 40,
            ),
            TabBar(
              controller: _controller,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              indicatorColor:Colors.red,
              labelColor:Colors.black,
              tabs: [_title("叫车"), _title("拼车出行"), _title("拼团旅行")],
            ),
           Expanded(
             child:  TabBarView(
              controller: _controller,
              children: <Widget>[
                AddList(false), 
                AddList(true), 
                AddList(true)
              ],
            ),
           )
          ],
        ));
  }
}
