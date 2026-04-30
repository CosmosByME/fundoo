import 'package:flutter/cupertino.dart';

class SignupNotifier extends ChangeNotifier {
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }
}