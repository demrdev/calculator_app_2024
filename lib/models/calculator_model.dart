import 'package:math_expressions/math_expressions.dart';

class CalculatorModel {
  String _expression = '';

  String get expression => _expression;

  void setExpression(String value) {
    _expression = value;
  }

  void clearExpression() {
    _expression = '';
  }

  void evaluateExpression(ContextModel context) {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_expression);
      double result = expression.evaluate(EvaluationType.REAL, context);
      _expression = result.toString();
    } catch (e) {
      _expression = 'Error';
    }
  }
}