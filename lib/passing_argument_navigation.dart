import 'package:flutter/material.dart';

class MyAppNavigationWithArgument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Main App",
      routes: Routes.all(),
    );
  }
}

// Screen Names
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.setting,
                    arguments: SettingScreenArguments(
                        "Setting Title", "Setting Content"));
              },
              child: Text("Go to Setting Screen"),
            ),
            RaisedButton(
              onPressed: () {
                print("Go To PostScreen");
                Navigator.pushNamed(context, Routes.post,
                    arguments: PostScreenArguments(
                        "Post Title update", "Post Message"));
              },
              child: Text("Go to Post Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text(args.title)],
        ),
      ),
    );
  }
}

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(args.title),
            RaisedButton(
              onPressed: () {
                print("Go To PostScreen update");
              },
              child: Text("Go to Post Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class BaseArgument {}

class PostScreenArguments extends BaseArgument {
  final String title;
  final String message;

  PostScreenArguments(this.title, this.message);
}

class SettingScreenArguments extends BaseArgument {
  final String title;
  final String message;

  SettingScreenArguments(this.title, this.message);
}

// Routes
class Routes {
  static final String home = '/';
  static final String post = '/post';
  static final String setting = '/setting';

  static Map<String, WidgetBuilder> all() {
    return {
      '$home': (context) => HomeScreen(),
      '$post': (context) => PostScreen(),
      '$setting': (context) => SettingScreen()
    };
  }
}
