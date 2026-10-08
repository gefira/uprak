import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan InkWell',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InkWell'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              print("Ditekan");
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}