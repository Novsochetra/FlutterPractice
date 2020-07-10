import 'package:flutter/material.dart';

// create the new page
class MySnackbarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Snack bar page',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Snack bar page"),
          ),
          body: SnackbarPage(),
        ));
  }
}

class SnackbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
            child: Text("Show Snackbar"),
            onPressed: () {
              final snackbar = SnackBar(
                content: Text("1 item deleted:"),
                action: SnackBarAction(label: "Undo", onPressed: () => {}),
              );
              Scaffold.of(context).showSnackBar(snackbar);
            }));
  }
}
