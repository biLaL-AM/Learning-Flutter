import 'package:flutter/material.dart';

import '../../main.dart';

class MySnackbar {
  //show snackbar on anyscreen funtion
  showSnackBar(
      {required String text,
      Color? backgroundcolor,
      double? bottompadding,
      VoidCallback? callback}) {
    final mySnackBar = SnackBar(
      content: Center(child: Text(text)),
      backgroundColor: backgroundcolor,
      duration: callback == null
          ? const Duration(seconds: 5)
          : const Duration(seconds: 60),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: callback == null
          ? null
          : SnackBarAction(label: "Retry", onPressed: callback),
      margin: bottompadding == null
          ? null
          : EdgeInsets.fromLTRB(15, 5, 15, bottompadding),
    );

    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(mySnackBar);
  }
}