import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CalculatorButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          textStyle: TextStyle(fontSize: 18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}