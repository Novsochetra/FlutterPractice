import 'package:flutter/material.dart';

class MyAppHorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Horizontal List View",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Horizontal List View"),
          ),
          body: _ListViewHorizontalBuilder(),
        ));
  }
}

class _ListViewHorizontalBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<_ListViewHorizontalBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ]));
  }
}
