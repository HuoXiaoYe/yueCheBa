import "package:flutter/material.dart";
import '../../config/book_info.dart';
import './book_item/book_item.dart';

class BookInfo extends StatefulWidget {
  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo>
    with SingleTickerProviderStateMixin {
  List<Map> BaseInfo = List(20);
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
    // this.setState(() {
    //   this.BaseInfo.add({});
    // });
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
