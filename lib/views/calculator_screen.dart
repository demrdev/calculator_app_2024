import 'package:calculator_app/constants/calculator_colors.dart';
import 'package:calculator_app/constants/calculator_texts.dart';
import 'package:calculator_app/models/calculator_model.dart';
import 'package:calculator_app/utils/calculator_context.dart';
import 'package:calculator_app/views/button_layout.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel _calculatorModel = CalculatorModel();
  late final List<void Function()> buttonActions;

  @override
  void initState() {
    super.initState();
    buttonActions = List.generate(
      CalculatorTexts.buttonTexts.length,
      (index) => () => _buttonPressed(CalculatorTexts.buttonTexts[index]),
    );
  }

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _calculatorModel.clearExpression();
      } else if (buttonText == '=') {
        _evaluate();
      } else {
        _calculatorModel.setExpression(_calculatorModel.expression + buttonText);
      }
    });
  }

  void _evaluate() {
    setState(() {
      _calculatorModel.evaluateExpression(CalculatorContext());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İleri Seviye Hesap Makinesi'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _calculatorModel.expression,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ButtonLayout(
                buttonTexts: CalculatorTexts.buttonTexts,
                buttonColors: CalculatorColors.buttonColors,
                buttonActions: buttonActions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}