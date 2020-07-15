import 'package:FirstFlutter/passing_argument_navigation.dart';
import 'package:FirstFlutter/snackbar.dart';
import 'package:flutter/material.dart';

class MyAppPassingDataBack extends StatelessWidget {
  const MyAppPassingDataBack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Passing Databack",
      routes: {
        '/': (context) => HomeScreen(),
        '/setting': (context) => SettingScreen()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Returning Data Demo"),
      ),
      body: Center(
          child: SelectionButton()
      )
    );
  }
}

_navigateAndDisplaySection(BuildContext context) async {
  final result = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => SectionScreen()));

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text("$result"),
      action: SnackBarAction(onPressed: () {}, label: "undo",),
    ));
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          _navigateAndDisplaySection(context);
        },
        child: Text("Go to pick screen"),
    );
  }
}

class SectionScreen extends StatelessWidget {
  const SectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Section Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  print("option 1");
                  Navigator.pop(context, 'Option 1');
                },
                child: Text("Option 1"),
              ),
              RaisedButton(
                onPressed: () {
                  print("option 2");
                  Navigator.pop(context, "option 2");
                },
                child: Text("Option 2"),
              ),
            ],
          ),
        ));
  }
}
