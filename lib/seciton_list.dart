import 'package:flutter/material.dart';

class MyAppSecitonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Section List",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Section List"),
        ),
        body: _SectionListViewBuilder(),
      ),
    );
  }
}

class _SectionListViewBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SectionListViewState();
}

class _SectionListViewState extends State<_SectionListViewBuilder> {
  final List<ListItem> items = List<ListItem>.generate(
      30,
      (index) => index % 6 == 0
          ? HeaderItem("Header $index")
          : MessageItem("Sender $index", "Receiver $index"));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubTitle(context));
        });
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

class HeaderItem implements ListItem {
  final String header;

  HeaderItem(this.header);

  @override
  Widget buildSubTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      this.header,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String receiver;

  MessageItem(this.sender, this.receiver);

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(this.sender);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(this.receiver);
  }
}
