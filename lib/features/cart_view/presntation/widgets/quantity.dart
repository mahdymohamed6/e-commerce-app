import 'package:flutter/material.dart';

class NumberCounterRow extends StatefulWidget {
  @override
  _NumberCounterRowState createState() => _NumberCounterRowState();
}

class _NumberCounterRowState extends State<NumberCounterRow> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      if (_counter <= 8) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 55, 55, 55), // Dark grey color
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementCounter,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 20.0,
          child: Text(
            '$_counter',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 55, 55, 55), // Dark grey color
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementCounter,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
