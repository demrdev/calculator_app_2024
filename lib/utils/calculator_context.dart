import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class CalculatorContext extends ContextModel {
  @override
  bool hasFunction(String name) {
    return functionMap.containsKey(name);
  }

  @override
  double evaluateFunction(String name, ContextModel context, List<double> args) {
    final Function? function = functionMap[name];
    if (function == null) {
      throw ArgumentError('Unknown function: $name');
    }
    return function(args);
  }

  static final Map<String, Function> functionMap = {
    'sin': (args) => math.sin(args.first),
    'cos': (args) => math.cos(args.first),
    'tan': (args) => math.tan(args.first),
    'log': (args) => math.log(args.first),
    'sqrt': (args) => math.sqrt(args.first),
  };
}