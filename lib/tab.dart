import 'package:flutter/material.dart';

class MyTabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tabbar example",
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Tabbar"),
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.local_taxi)),
                  Tab(icon: Icon(Icons.motorcycle)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.directions_walk)),
                ]),
              ),
              body: TabbarWidget(),
            )));
  }
}

class TabbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Center(
        child: Text("Taxi"),
      ),
      Center(
        child: Text("Moto"),
      ),
      Center(
        child: Text("Bike"),
      ),
      Center(
        child: Text("Walk"),
      )
    ]);
  }
}
