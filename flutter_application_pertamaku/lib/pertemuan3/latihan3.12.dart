import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(merk: "Yamaha", tahun: 2021),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String merk;
  final int tahun;

  // Constructor
  HomeScreen({required this.merk, required this.tahun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kendaraan Info")),
      body: Center(
        child: Text(
          "Merek: $merk, Tahun: $tahun",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}