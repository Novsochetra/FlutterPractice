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
  final List<SampleImage> items = <SampleImage>[
    SampleImage(id: 0, download_url: "https://unsplash.com/photos/yC-Yzbqy7PY"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1/5616/3744"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/10/2500/1667"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/100/2500/1656"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1000/5626/3635"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1001/5616/3744"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1002/4312/2868"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1004/5616/3744"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1005/5760/3840"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1006/3000/2000"),
    SampleImage(id: 0, download_url: "https://picsum.photos/id/1008/5616/3744")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
            key: Key(item.download_url),
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
                child: ListTile(
                    title: Row(
                  children: <Widget>[
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        "https://picsum.photos/250?image=9",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Text("Row"),
                  ],
                ))));
      },
    );
  }
}

class SampleImage {
  final int id;
  final String download_url;

  SampleImage({this.id, this.download_url});
}
