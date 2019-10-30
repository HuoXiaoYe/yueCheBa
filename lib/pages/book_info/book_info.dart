import 'dart:convert';

import "package:flutter/material.dart";
import '../../config/book_info.dart';
import './book_item/book_item.dart';
import 'package:dio/dio.dart';

class BookInfo extends StatefulWidget {
  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo>
    with SingleTickerProviderStateMixin {
  var index = 0;
  List<Map> BaseInfo = [];
  TabController _controller;
  @override
  void initState() {
    BaseInfo = bookInfo;
    _controller = TabController(length: 4, vsync: this);
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

  Future _loadData() async {
    Dio dio = new Dio();
    var response = await dio.post("http://10.130.7.36:8080/getData");
    var responseData = jsonDecode(response.toString());
    // print(responseData);
    this.setState(() {
      this.BaseInfo = [];
      bookInfo.removeRange(0,this.index); //范围删除
      this.BaseInfo = bookInfo;
      // 删除元素
      this.index = 0;
      responseData.forEach((val) {
        this.BaseInfo.insert(this.index, val);
        this.index++;
        print(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: 10,
        ),
        TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3.0,
          indicatorColor: Colors.red,
          labelColor: Colors.black,
          tabs: [_title("全部"), _title("文登"), _title("威海"), _title("其他")],
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              RefreshIndicator(
                child: BookItem(BaseInfo),
                onRefresh: _loadData,
              ),
              BookItem(BaseInfo),
              BookItem(BaseInfo),
              BookItem(BaseInfo),
            ],
          ),
        )
      ],
    ));
  }
}
