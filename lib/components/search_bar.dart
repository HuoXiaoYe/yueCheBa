import "package:flutter/material.dart";

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(255, 0, 0, 1),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("约车吧",style: TextStyle(color: Colors.white),),
          
        ],
      ),
    );
  }
}
