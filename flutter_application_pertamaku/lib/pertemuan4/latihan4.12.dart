import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Button',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Buttons'),
        ),
        body: Column(
          children: <Widget>[
            // Mengganti RaisedButton dengan ElevatedButton
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Mengatur warna background
              ),
              child: const Text("Elevated Button"),
              onPressed: () {},
            ),
            MaterialButton(
              color: Colors.lime,
              child: const Text("Material Button"),
              onPressed: () {},
            ),
            // Mengganti FlatButton dengan TextButton
            TextButton(
              child: const Text("Text Button"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}