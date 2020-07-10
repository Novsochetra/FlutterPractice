import 'package:flutter/material.dart';

class MyAppTransition extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: FirstRoute());
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Go to Second route"),
            onPressed: () {
              print("Go to second route");
              Navigator.of(context).push(_createRoute());
            }),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondRoute(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0, 1);
      var end = Offset.zero;

      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route"),
      ),
      body: Center(
        child: Text("Second Route"),
      ),
    );
  }
}
