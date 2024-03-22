import 'package:calculator_app/views/calculator_button.dart';
import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  final List<String> buttonTexts;
  final List<Color> buttonColors;
  final List<VoidCallback> buttonActions;

  ButtonLayout({
    required this.buttonTexts,
    required this.buttonColors,
    required this.buttonActions,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: buttonTexts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2.2,
      ),
      itemBuilder: (context, index) {
        return CalculatorButton(
          text: buttonTexts[index],
          color: buttonColors[index],
          onPressed: buttonActions[index],
        );
      },
    );
  }
}