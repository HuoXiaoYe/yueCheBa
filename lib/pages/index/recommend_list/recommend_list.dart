import 'package:flutter/material.dart';
import '../../../config/recommend.dart';
import '../place_detail/place_detail.dart';

class RecommendList extends StatefulWidget {
  @override
  _RecommendListState createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {
  List<Map> _ListData = recommendList;

  Widget _item(data) {
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.only(bottom: 2),
      height: 260,
      padding: EdgeInsets.all(2),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              // 上方图片文字
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 2))),
              padding: EdgeInsets.only(bottom: 6),
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // 图片
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Image.network(
                              data["img"],
                              width: 120,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 3, right: 8, bottom: 2),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(255, 171, 30, 1),
                                      Color.fromRGBO(255, 142, 8, 1)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15))),
                              child: Text(
                                data["tip"],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // 文字介绍
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 景点名称
                        Text(
                          data["title"],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        Padding(
                          // 评价星星评论数
                          padding: EdgeInsets.only(top: 2, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromRGBO(255, 180, 54, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromRGBO(255, 180, 54, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromRGBO(255, 180, 54, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromRGBO(255, 180, 54, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromRGBO(255, 180, 54, 1),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  data['comment'] + "评论",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "￥",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 131, 82, 1)),
                                  ),
                                  Text(
                                    data["price_0"],
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 131, 82, 1),
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text("起"),
                                  )
                                ],
                              )),
                              Container(
                                child: Text(data["addr"]),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          alignment: Alignment.center,
                          child: Text(
                            "赠券",
                            style: TextStyle(color: Colors.orange),
                          ),
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.orange)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            _discount(data["desc1"], data["price_1"], true),
            _discount(data["desc2"], data["price_2"], false),
          ],
        ),
      ),
    );
  }

  Widget _discount(desc, price, hasLine) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: hasLine
              ? Border(bottom: BorderSide(color: Colors.black12, width: 2))
              : null
          //bottom: BorderSide(color: Colors.black12,width: 2 )
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 270,
            child: Text(
              desc,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  "￥",
                  style: TextStyle(fontSize: 12, color: Colors.orange),
                ),
                Text(
                  price,
                  style: TextStyle(fontSize: 24, color: Colors.orange),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            // Container(
            //   //顶部搜索 筛选区域
            //   height: 80,
            // ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 0),
                margin: EdgeInsets.only(top: 0),
                child: ListView.builder(
                    // 景点列表
                    itemCount: _ListData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PlaceDetail(_ListData[index]["title"]),
                            ));
                          },
                          child: _item(
                            _ListData[index],
                          ));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
