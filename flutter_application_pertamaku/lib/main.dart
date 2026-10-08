import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Latihan', home: InputForm());
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Form")),
      body: Center(
        // Memusatkan seluruh widget di dalam body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Enter your name'),
                ), // TextField
              ), // Container
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String name = _controller.text;
                  showDialog(
                    context: context,
                    builder: (context) => 
                        AlertDialog(content: Text("Hello, $name!")),
                  );
                },
                child: Text('Submit'),
              ), // ElevatedButton
            ],
          ), // Column
        ), // Padding
      ), // Center
    ); // Scaffold
  }
}