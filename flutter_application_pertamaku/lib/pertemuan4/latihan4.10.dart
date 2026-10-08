import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Container")),
        body: Container(
          padding: EdgeInsets.all(32.0),
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.purple,
          ),
          child: Text(
            'Haiii Gege',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    ));