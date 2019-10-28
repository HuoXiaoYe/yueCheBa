import "package:flutter/material.dart";
import "./pages/home/home.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 23, 23, 1)
      ),
      home: CarHome()
    );
  }
}