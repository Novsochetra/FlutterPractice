import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (contxt) => Counter(), child: MyApp()));
}

// MODEL
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }

  void decrement() {
    value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Provider Statement", home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider Pattern")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        tooltip: "Tooltips",
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have been push this button many times"),
            Consumer(
                builder: (BuildContext context, Counter counter, Widget child) {
              return Text("${counter.value}");
            }),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SettingScreen()));
              },
              child: Text("Go to Detail"),
            )
          ],
        ),
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
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
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Consumer(
                builder: (BuildContext context, Counter state, child) {
                  return Text("${state.value}");
                },
              )),
        )));
  }
}
