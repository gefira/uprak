import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan SizedBox',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SizedBox'),
        ),
        body: Column(
          children: <Widget>[
            Text("A", style: TextStyle(fontSize: 30.0)),
            SizedBox(height: 20.0),
            Text("B", style: TextStyle(fontSize: 30.0)),
          ],
        ),
      ),
    );
  }
}