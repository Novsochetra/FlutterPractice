import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyAppTodoListFetchingDataFromServer extends StatefulWidget {
  MyAppTodoListFetchingDataFromServer({Key key}) : super(key: key);
  @override
  _MyAppTodoListFetchingDataFromServerState createState() =>
      _MyAppTodoListFetchingDataFromServerState();
}

class _MyAppTodoListFetchingDataFromServerState
    extends State<MyAppTodoListFetchingDataFromServer> {
  Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();
    todos = fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List Todo From Server",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Todo List Fetching Data From Server"),
          ),
          body: Center(
            child: FutureBuilder(
              future: todos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _TodoList(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error);
                }

                return CircularProgressIndicator();
              },
            ),
          )),
    );
  }
}

class _TodoList extends StatelessWidget {
  List<Todo> todos;

  _TodoList(List<Todo> todos) {
    this.todos = todos;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.todos.length,
      itemBuilder: (context, index) {
        var item = todos[index];
        return _TodoListItem(item);
      },
    );
  }
}

class _TodoListItem extends StatelessWidget {
  Todo todo;

  _TodoListItem(Todo todo) {
    this.todo = todo;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("ITEM TAP");
      },
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text("${todo.completed}"),
      ),
    );
  }
}

class Todo {
  final int id;
  final String title;
  final bool completed;
  final int userId;

  Todo({this.id, this.title, this.completed, this.userId});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        title: json['title'],
        id: json['id'],
        completed: json['completed'],
        userId: json['userId']);
  }
}

Future<List<Todo>> fetchTodos() async {
  final resp = await http.get("https://jsonplaceholder.typicode.com/todos/1");
  final resp1 = await http.get("https://jsonplaceholder.typicode.com/todos");

  if (resp.statusCode == 200) {
    var respDecode = json.decode(resp1.body) as List;
    return respDecode.map((res) => Todo.fromJson(res)).toList();
  } else {
    throw Exception('Server error');
  }
}
