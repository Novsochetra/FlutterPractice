import 'package:flutter/material.dart';

class MyAppSwipeDismiss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swipe Dismiss",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Swipe Dismiss"),
        ),
        body: _ListViewBuilder(),
      ),
    );
  }
}

class _ListViewBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ListViewState();
}

class _ListViewState extends State<_ListViewBuilder> {
  final items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              final snackbar = SnackBar(
                  content: Text("1 deleted item"),
                  action: SnackBarAction(
                      label: "undo",
                      onPressed: () {
                        print("undo deleted item");
                      }));
              setState(() {
                items.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(snackbar);
            },
            background: Container(color: Colors.red),
            child: InkWell(
              onTap: () {
                print("item tap");
              },
              child: ListTile(title: Text(item)),
            ));
      },
    );
  }
}
