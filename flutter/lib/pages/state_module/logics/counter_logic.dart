import 'package:flutter/foundation.dart';

class CounterLogic extends ChangeNotifier{

  int _counter = 0;
  int get counter => _counter;

  void decrease(){
    _counter--;
    notifyListeners();
  }

  void increase(){
    _counter++;
    notifyListeners();
  }

}