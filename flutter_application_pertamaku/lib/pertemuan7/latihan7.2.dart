import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> toppings = [
    "Onions",
    "Mushrooms",
    "Black olives",
    "Green peppers",
    "Extra cheese",
  ];

  List<bool> selectedToppings = [
    false,
    false,
    false,
    false,
    false,
  ];

  String selectedSize = "Small";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Checkbox & Radio Buttons'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),

              Text(
                'Select Your Pizza Toppings :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              CheckboxListTile(
                title: Text("Onions"),
                value: selectedToppings[0],
                onChanged: (value) {
                  setState(() {
                    selectedToppings[0] = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Mushrooms"),
                value: selectedToppings[1],
                onChanged: (value) {
                  setState(() {
                    selectedToppings[1] = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Black olives"),
                value: selectedToppings[2],
                onChanged: (value) {
                  setState(() {
                    selectedToppings[2] = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Green peppers"),
                value: selectedToppings[3],
                onChanged: (value) {
                  setState(() {
                    selectedToppings[3] = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Extra cheese"),
                value: selectedToppings[4],
                onChanged: (value) {
                  setState(() {
                    selectedToppings[4] = value!;
                  });
                },
              ),

              SizedBox(height: 10.0),

              Text(
                'Select Your Pizza Size :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              RadioListTile(
                title: Text("Small"),
                value: "Small",
                groupValue: selectedSize,
                onChanged: (value) {
                  setState(() {
                    selectedSize = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: Text("Medium"),
                value: "Medium",
                groupValue: selectedSize,
                onChanged: (value) {
                  setState(() {
                    selectedSize = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: Text("Large"),
                value: "Large",
                groupValue: selectedSize,
                onChanged: (value) {
                  setState(() {
                    selectedSize = value.toString();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}