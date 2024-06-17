import 'package:somador/models/number.dart';

class CalculatorController {
  static final CalculatorController instance = CalculatorController._();

  CalculatorController._();

  void sum(double valueOne, double valueTwo) {
    Number.instance.setCounter(valueOne + valueTwo);
  }
}
