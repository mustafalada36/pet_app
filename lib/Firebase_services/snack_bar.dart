import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}

class mySnack {
  //info
  static void info(String msg) {
    Get.snackbar("Info", msg,
        backgroundColor: Colors.redAccent.shade200,
        colorText: Colors.white,
        duration: Duration(seconds: 2));
  }

//success
  static void success(String msg) {
    Get.snackbar("Success", msg,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2));
  }

//error
  static void error(String msg) {
    Get.snackbar("Error", msg,
        backgroundColor: Colors.redAccent.shade200,
        colorText: Colors.white,
        duration: Duration(seconds: 3));
  }
}
