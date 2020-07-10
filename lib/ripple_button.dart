import 'package:flutter/material.dart';

class MyAppRipple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ripple Button",
        home: Scaffold(
          appBar: AppBar(title: Text("Ripple Button Effect")),
          body: RippleButtonBuilder(),
        ));
  }
}

class RippleButtonBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () {
            final snackbar = SnackBar(
                content: Text("My Snackbar"),
                action: SnackBarAction(label: "undo", onPressed: () {}));

            Scaffold.of(context).showSnackBar(snackbar);
          },
          child: Padding(
              padding: EdgeInsets.all(10.0), child: Text("My Ripple Button"))),
    );
  }
}
