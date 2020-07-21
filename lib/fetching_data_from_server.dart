import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final resp = await http.get("https://jsonplaceholder.typicode.com/albums/1");

  if (resp.statusCode == 200) {
    return Album.fromJson(json.decode(resp.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class MyAppFetchData extends StatefulWidget {
  MyAppFetchData({Key key}) : super(key: key);
  @override
  _MyAppFetchDataState createState() => _MyAppFetchDataState();
}

class _MyAppFetchDataState extends State<MyAppFetchData> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetching Data',
        home: Scaffold(
            appBar: AppBar(title: Text('Fetching Data from server')),
            body: Center(
              child: FutureBuilder(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error);
                  }

                  return CircularProgressIndicator();
                },
              ),
            )));
  }
}

class Album {
  final String title;
  final int id;
  final int userId;

  Album({this.id, this.userId, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title'], userId: json['userId']);
  }
}
