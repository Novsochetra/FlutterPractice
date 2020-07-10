import 'package:flutter/material.dart';

class MyAppGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        body: _GridViewBuilder(),
      ),
    );
  }
}

class _GridViewBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GridViewState();
}

class _GridViewState extends State<_GridViewBuilder> {
  final items = List.generate(20, (index) => "Item $index");
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            20,
            (index) => Center(
                  child: Text(
                    items[index],
                    style: TextStyle(fontSize: 20),
                  ),
                )));
  }
}
