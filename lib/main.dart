import 'package:FirstFlutter/drawer.dart';
import 'package:FirstFlutter/grid_view.dart';
import 'package:FirstFlutter/horizontal_list_view.dart';
import 'package:FirstFlutter/page_transition.dart';
import 'package:FirstFlutter/ripple_button.dart';
import 'package:FirstFlutter/seciton_list.dart';
import 'package:FirstFlutter/snackbar.dart';
import 'package:FirstFlutter/swip_dismiss.dart';
import 'package:FirstFlutter/tab.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  // runApp(MyAppDrawer());
  // runApp(MySnackbarApp());
  // runApp(MyTabApp());
  // runApp(MyAppRipple());
  // runApp(MyAppSwipeDismiss());
  // runApp(MyAppGridView());
  // runApp(MyAppHorizontalListView());
  runApp(MyAppSecitonList());
}

class MyApp extends StatelessWidget {
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
      appBar: AppBar(title: Text("First Route")),
      body: Container(
        child: Center(
          child: RaisedButton(
              child: Text("Second Route"),
              onPressed: () {
                print("GO TO SECOND ROUTE");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()));
              }),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Route")),
      body: Container(
          child: Center(
        child: RaisedButton(
            child: Text("Go To First Route"),
            onPressed: () {
              Navigator.pop(context);
            }),
      )),
    );
  }
}
