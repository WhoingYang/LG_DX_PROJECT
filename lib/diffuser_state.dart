import 'package:flutter/material.dart';

class DiffuserState extends ChangeNotifier {
  bool _isDiffuserOn = true; // 초기 상태

  bool get isDiffuserOn => _isDiffuserOn;

  void toggleDiffuser() {
    _isDiffuserOn = !_isDiffuserOn;
    notifyListeners();
  }
}
