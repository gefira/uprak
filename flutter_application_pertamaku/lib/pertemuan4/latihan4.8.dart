import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Text Style")),
        body: Text(
          'Ini Text',
          style: TextStyle(
            color: Colors.blue,
            backgroundColor: Colors.pink,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));