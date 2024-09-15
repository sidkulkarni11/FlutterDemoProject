
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_project/model/BasicModel.dart';

class Basiccontroller extends ChangeNotifier{
  int _count = 0 ;

  int get count  => _count;

  bool _isVisible = false;

  bool get isVisble  => _isVisible;

  List<Basicmodel> _ofname = [
    Basicmodel(age : 18),
    Basicmodel(age: 25,name: "Devesh"),
    Basicmodel(age: 25)
  ];

  List<Basicmodel> get ofName => _ofname;
  void toggle(){
    _isVisible = !isVisble;
    notifyListeners();
  }
  void increaseCount(){
    _count++;
    notifyListeners();
  }
}

