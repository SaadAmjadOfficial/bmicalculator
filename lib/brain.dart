import 'dart:math';

class Brain {
  Brain({required this.height, required this.w8});

  final double height;
  final int w8;
  double bmi = 0;

  double bmiVal() {
    bmi = w8 / pow((height * 0.3048), 2);
    return bmi;
  }

  String bmiTex() {
    if(bmi >= 25) {
      return "OVERWEIGHT";
    } else if(bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String bmiPara() {
    if(bmi >= 25) {
      return "Try to Exercise more!";
    } else if(bmi > 18.5) {
      return "Weldone! Good Job.";
    } else {
      return "You can Eat a bit more!";
    }
  }
}
