import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  String _failure = "";
  String get failure => _failure;
  void setFailure(String failure) {
    _failure = failure;
    notifyListeners();
  }
}
