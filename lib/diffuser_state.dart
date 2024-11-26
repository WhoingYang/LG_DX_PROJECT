import 'package:flutter/foundation.dart'; // ChangeNotifier를 사용하기 위해 필요

class DiffuserState with ChangeNotifier {
  bool _isDiffuserOn = false;

  bool get isDiffuserOn => _isDiffuserOn;

  void toggleDiffuser() {
    _isDiffuserOn = !_isDiffuserOn;
    notifyListeners(); // 상태 변경 후 UI 업데이트
  }
}
