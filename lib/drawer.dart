import 'package:flutter/material.dart';

class MyAppDrawer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(color: Colors.lightBlue),
            ),
            ListTile(
              title: Text("Home"),
            ),
            ListTile(
              title: Text("Setting"),
            ),
            ListTile(
              title: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
