import 'package:flutter/material.dart';

class MyAppSilverAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Silver Appbar",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Silver Appbar"),
          ),
          body: _SilverAppbarBuilder(),
        ));
  }
}

class _SilverAppbarBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SilverAppbarState();
}

class SilverAppbarState extends State<_SilverAppbarBuilder> {
  // final items = "Sampel item"
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Silver Appbar Text"),
          floating: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 200,
          pinned: true,
          stretch: true,
          snap: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
                      onTap: () {
                        print("Tab on item $index");
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Text("Item $index"),
                      ),
                    ),
                childCount: 100)),
      ],
    );
  }
}
