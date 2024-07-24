import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastStates { SUCCESS, ERROR, WARNING }

class Apptoast
{
  static void showToast({
    required String msg,
    required ToastStates state,
    Toast toastLength = Toast.LENGTH_LONG,
    ToastGravity gravity = ToastGravity.BOTTOM,
    int timeInSecForIosWeb = 1,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: _toastBackgroundColor(state),
      textColor: _toastFontColor(state),
      fontSize: fontSize,
    );
  }

  static Color _toastBackgroundColor(ToastStates state) {
    switch (state) {
      case ToastStates.SUCCESS:
        return Colors.green;
      case ToastStates.ERROR:
        return Colors.red;
      case ToastStates.WARNING:
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  static Color _toastFontColor(ToastStates state) {
    switch (state) {
      case ToastStates.SUCCESS:
        return Colors.white;
      case ToastStates.ERROR:
        return Colors.white;
      case ToastStates.WARNING:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}