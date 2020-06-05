// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Super App'),
        ),
        body: Center(
          child: TextControl(),
        ),
      ),
    );
  }
}

class TextControl extends StatefulWidget {
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  var text = 'Potato';

  void _changeText() {
    setState(() {
      text = 'Tomato';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28),
        ),
        RaisedButton(child: Text('Button'), onPressed: _changeText),
      ],
    );
  }
}
