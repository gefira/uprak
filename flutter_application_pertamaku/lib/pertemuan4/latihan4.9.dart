import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Icon',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Icons'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.access_alarm),
                  Text('Alarm'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.phone),
                  Text('Phone'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.book),
                  Text('Book'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}