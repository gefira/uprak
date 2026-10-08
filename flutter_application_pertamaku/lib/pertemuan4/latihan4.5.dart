import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text("Halo 1 !!!"),
            color: Colors.lime,
            padding: EdgeInsets.all(16.0),
          ),
          Container(
            child: Text("Halo 2 !!!"),
            color: Colors.purple,
            padding: EdgeInsets.all(16.0),
          ),
          Container(
            child: Text("Halo 3 !!!"),
            color: Colors.lightBlue,
            padding: EdgeInsets.all(16.0),
          ),
        ],
      ),
    );
  }
}