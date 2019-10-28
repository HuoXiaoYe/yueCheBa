import 'package:flutter/material.dart';

class BookCarDetail extends StatelessWidget {
  final String _title;
  BookCarDetail(this._title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("我是约车详情页面"+_title),
      ),
    );
  }
}