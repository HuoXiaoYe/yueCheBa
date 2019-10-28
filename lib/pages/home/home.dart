import 'package:flutter/material.dart';
import "../../components/search_bar.dart";
import '../../pages/add/add.dart';
import '../../pages/index/index.dart';
import "../../pages/book_info/book_info.dart";
import '../../pages/chat/chat.dart';
import '../../pages/person/person.dart';

class CarHome extends StatefulWidget {
  @override
  _CarHomeState createState() => _CarHomeState();
}

class _CarHomeState extends State<CarHome> {
  List<Widget> pageList = []; 
  int _activeIndex = 0;
  @override
  void initState() {
    this.pageList..add(Index())..add(BookInfo())..add(Chat())..add(Person());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SearchBar(),
        preferredSize: Size.fromHeight(40),
      ),
      // body: pageList[this._activeIndex],
       body: IndexedStack(
        index: _activeIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this._activeIndex,
        onTap: (int index) {
          setState(() {
            this._activeIndex = index;
          });
        },
        selectedFontSize:12,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          // Container(
          //   padding: EdgeInsets.only(right: 20),
          //   child: Text("sdfa"),
          // ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
              ),
              title: Text('待拼单')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              title: Text('聊一聊')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('个人中心')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => new Add()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// class CarHome extends StatelessWidget {
//   @override

// }
