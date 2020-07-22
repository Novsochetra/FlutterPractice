import 'package:flutter/material.dart';

class MyAppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(title: Text('Material App Bar')),
            body: Container(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _BottomTab(),
              ],
            ))));
  }
}

class _BottomTab extends StatelessWidget {
  const _BottomTab({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _ButtonWithIcon(
            icon: Icons.call,
            label: "Call",
          ),
          _ButtonWithIcon(
            icon: Icons.router,
            label: "Route",
          ),
          _ButtonWithIcon(
            icon: Icons.share,
            label: "Share",
          )
        ],
      ),
    ));
  }
}

class _ButtonWithIcon extends StatelessWidget {
  IconData iconName;
  String label;

  _ButtonWithIcon({IconData icon, String label}) {
    this.iconName = icon;
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          print("Called Press");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                iconName,
                color: Colors.lightBlue,
                size: 24,
              ),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
