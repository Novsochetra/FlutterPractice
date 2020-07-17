import 'package:flutter/material.dart';

class MyAppPassingDataToNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "Passing data to new screen", routes: {
      '/': (context) => TodoScreen(),
      '/todoDetail': (context) => TodoListDetailScreen()
    });
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Screen"),
      ),
      body: TodoList(),
    );
  }
}

class Todo {
  final String title;
  final String description;
  final String subTitle;

  Todo(this.title, this.description, this.subTitle);
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int totalTodo = 20;
    final todos = List.generate(
        totalTodo,
        (index) =>
            Todo('Title $index', 'Description $index', 'SubTitle $index'));

    return ListView.builder(
      itemCount: totalTodo,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TodoListDetailScreen(),
                  settings: RouteSettings(arguments: todos[index])));
        },
        title: Text(todos[index].title),
        subtitle: Text(todos[index].subTitle),
      ),
    );
  }
}

class TodoListDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List Detail"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(todo.title),
            Text(todo.description),
          ],
        ),
      ),
    );
  }
}
