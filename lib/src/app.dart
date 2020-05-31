import 'package:flutter/material.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('${this.counter}'),
        appBar: AppBar(
          title: Text('Let\'s See Some Images!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => this.counter++);
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
