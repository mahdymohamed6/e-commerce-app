import 'package:flutter/material.dart';

class SizeListViewItem extends StatefulWidget {
  const SizeListViewItem({
    super.key,
    required this.size,
  });
  final String size;
  @override
  State<SizeListViewItem> createState() => _SizeListViewItemState();
}

class _SizeListViewItemState extends State<SizeListViewItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isPressed
                ? const Color.fromARGB(255, 92, 91, 91)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color.fromARGB(255, 103, 102, 102),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text(
              widget.size,
              style: TextStyle(
                  color: isPressed ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
