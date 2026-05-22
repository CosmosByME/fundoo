import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showWarningToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.orangeAccent,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
