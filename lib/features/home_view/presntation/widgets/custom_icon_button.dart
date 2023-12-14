import 'package:flutter/material.dart';

class CustomiIconButton extends StatelessWidget {
  const CustomiIconButton({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 40,
      color: const Color.fromARGB(255, 92, 88, 88),
      weight: 0.8,
    );
  }
}
