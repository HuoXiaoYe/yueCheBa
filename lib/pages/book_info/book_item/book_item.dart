import "package:flutter/material.dart";



class BookItem extends StatelessWidget {
  Widget _desc(String title, String desc){
    return Container(
      child: Row(
        children: <Widget>[
          ListTile(
            leading: Container(
              child: Text(title),
            ),
            title: Text(desc),
          )
        ],
      ),
    );
  }
  Widget _item(data) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container( // 头像
              margin: EdgeInsets.only(top: 6,left: 10),
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
            _desc("时间",data["time"]),
            _desc("时间",data["time"]),
            _desc("时间",data["time"]),
            _desc("时间",data["time"]),
          ],
        ),
      ),
    );
  }

  List<Map> info;
  BookItem(this.info);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: this.info.map((data) => _item(data)).toList(),
    ));
  }
}
