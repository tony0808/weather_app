import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 340,
      color: const Color.fromARGB(255, 98, 98, 98),
    );
  }
}