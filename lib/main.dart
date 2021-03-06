import 'package:FirstFlutter/card.dart';
import 'package:FirstFlutter/drawer.dart';
import 'package:FirstFlutter/fetching_data_from_server.dart';
import 'package:FirstFlutter/grid_view.dart';
import 'package:FirstFlutter/horizontal_list_view.dart';
import 'package:FirstFlutter/navigation.dart';
import 'package:FirstFlutter/navigation_with_name_routes.dart';
import 'package:FirstFlutter/page_transition.dart';
import 'package:FirstFlutter/passing_data_back.dart';
import 'package:FirstFlutter/ripple_button.dart';
import 'package:FirstFlutter/seciton_list.dart';
import 'package:FirstFlutter/silver_appbar.dart';
import 'package:FirstFlutter/snackbar.dart';
import 'package:FirstFlutter/swip_dismiss.dart';
import 'package:FirstFlutter/tab.dart';
import 'package:FirstFlutter/passing_argument_navigation.dart';
import 'package:FirstFlutter/passing_data_to_new_screen.dart';
import 'package:FirstFlutter/todo_list_fetching_data_from_server.dart';
import 'package:FirstFlutter/gridview_layout.dart';
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
  // runApp(MyAppSecitonList());
  // runApp(MyAppSilverAppbar());
  // runApp(MyAppNavigation());
  // runApp(MyAppNavigationWithNameRoutes());
  // runApp(MyAppNavigationWithArgument());
  //runApp(MyAppPassingDataBack());
  //runApp(MyAppFetchData());
  //runApp(MyAppTodoListFetchingDataFromServer());
  //runApp(MyAppCard());
  runApp(MyAppGridViewDataFromApi());
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
