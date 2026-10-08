import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan 4.15',
      home: PageBasicList(),
    );
  }
}

class PageBasicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Basic List'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Alarm'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Camera'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Message'),
          ),
        ],
      ),
    );
  }
}