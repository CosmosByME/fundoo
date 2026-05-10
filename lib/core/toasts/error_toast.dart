import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showErrorToast(FToast toast, String message) {
  Widget toastContent = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.redAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error, color: Colors.white, size: 28.0),
        const SizedBox(width: 12.0),
        Flexible(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );

  toast.showToast(
    child: toastContent,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 2),
  );
}
