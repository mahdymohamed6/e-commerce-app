import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  const TimeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Center(
          child: Text(
            '00 : 00 : 00 :00 ',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey[850]),
          ),
        ),
      ),
    );
  }
}
