import 'package:mhws/view/utils/export_all.dart';

class AssessmentController extends GetxController {
  String? goal;
  String? gender;
  int? age;
  int? weight;
  String weightUnit = "kg";
  String mood = 'neutral';
  bool? hasPain;
  String medication = '';
  double sleepSlider = 1;
  int stressLevel = 5;

  void setstressLevel(_stressLevel) {
    stressLevel = _stressLevel;
    update();
  }

  void setGoal(_goal) {
    goal = _goal;
    update();
  }

  void setSleepSlider(_sleepSlider) {
    sleepSlider = _sleepSlider;
    update();
  }

  void setHasPain(_hasPain) {
    hasPain = _hasPain;
    update();
  }

  void setGender(_gender) {
    gender = _gender;
    update();
  }

  void setAge(_age) {
    age = _age;
    update();
  }

  void setWeight(_weight) {
    weight = _weight;
    update();
  }

  void setMood(_mood) {
    mood = _mood;

    update();
  }

  void setWeightUnit(_weightUnit) {
    weightUnit = _weightUnit;
    update();
  }

  void setMedication(_medication) {
    medication = _medication;
    update();
  }
}
