import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'The',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 17),
        ),
        Text('basic',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 17)),
        Text('look',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17)),
      ],
    );
  }
}
