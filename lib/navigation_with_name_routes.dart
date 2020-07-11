import 'package:flutter/material.dart';

class MyAppNavigationWithNameRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App Navigation",
      routes: {
        '/': (context) => _HomeScreen(),
        '/home': (context) => _HomeScreen(),
        '/setting': (context) => _SettingScreen()
      },
    );
  }
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
          child: InkWell(
        onTap: () {
          print("Go to setting screen");
          Navigator.pushNamed(context, '/setting');
        },
        child:
            Padding(padding: EdgeInsets.all(10), child: Text("Go To Setting")),
      )),
    );
  }
}

class _SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: Center(
            child: InkWell(
          onTap: () {
            print("Go back");
            Navigator.pop(context);
          },
          child: Padding(padding: EdgeInsets.all(10), child: Text("Go back")),
        )));
  }
}
