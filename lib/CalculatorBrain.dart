import 'dart:math' show pow;

import 'constants.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final double height;
  final double weight;

  getResult() {
    kBMI = weight / pow(height / 100, 2);
    if (kBMI >= 30) {
      kResult = 'OBESE';
      kBody =
          'DANGER!! your are prone to get many problems , So you must  Exercise and Diet';
    } else if (kBMI >= 25) {
      kResult = 'OVERWEIGHT';
      kBody =
          'You have a higher body weight than normal , Please try to Exercise';
    } else if (kBMI > 18.5) {
      kResult = 'NORMAL';
      kBody = 'You have a PERFECT body weight Enjoy';
    } else {
      kResult = 'UNDERWEIGHT';
      kBody = 'You have a lower body weight than normal , Please try to Eat';
    }
  }
}
