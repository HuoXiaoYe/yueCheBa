import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final String _title;
  PlaceDetail(this._title);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_title),
      ),
    );
  }
}