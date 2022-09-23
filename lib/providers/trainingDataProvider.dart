import 'package:flutter/cupertino.dart';

class TrainingData {
  final DateTime date;
  final List<String> method;
  late int start = DateTime.now().millisecondsSinceEpoch, end;
  late Duration duration;
  TrainingData({required this.date, required this.method});

  void endTraining() {
    this.end = DateTime.now().millisecondsSinceEpoch;
    this.duration = Duration(milliseconds: this.end - this.start);
  }
}

class TrainingDataProvider with ChangeNotifier {
  TrainingData? data;

  TrainingDataProvider({this.data});

  void setTrainingData(TrainingData newData) {
    this.data = newData;
    notifyListeners();
  }
}
