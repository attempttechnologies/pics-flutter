import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'widgets/image_list.dart';

import 'dart:convert';

import 'models/image_model.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    this.counter++;
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/${this.counter}');

    final imageModel = new ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
      this.images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s See Some Images!'),
        ),
        body: ImageList(images: this.images),
        floatingActionButton: FloatingActionButton(
          onPressed: this.fetchImage,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
