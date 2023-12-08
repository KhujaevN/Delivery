import 'package:flutter/cupertino.dart';

class CounterModel with ChangeNotifier {
  int _counter = 1;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 1) {
      _counter--;
      notifyListeners();
    }
  }
}