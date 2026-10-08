import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan TextFormField',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Form Field'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "Username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}