import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FlushBarHelper{
  static void flushBarErrorMessage(String message,BuildContext context)
  {
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(8),
          backgroundColor:Colors.white,
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.redAccent,
          ),
          messageColor: Colors.black,
          flushbarStyle: FlushbarStyle.FLOATING,
          duration:const Duration(seconds: 5),
          leftBarIndicatorColor: Colors.redAccent[400],
          message: message,
        )..show(context));
  }
  static void flushBarWarningMessage(String message,BuildContext context)
  {
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.info_outline,
            color: Color(0xFFFFA726),
          ),
          flushbarStyle: FlushbarStyle.FLOATING,
          duration:const Duration(seconds: 5),
          message: message,
          boxShadows: const[BoxShadow(color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 1.0,)],
          messageColor: Colors.black,
          leftBarIndicatorColor: Colors.yellowAccent[900],
        )..show(context));
  }
  static Future<void> flushBarSuccessMessage(String message, BuildContext context) {
    return Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: Colors.white,
      icon: const Icon(
        Icons.check,
        color: Colors.green,
      ),
      messageColor: Colors.black,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      message: message,
      boxShadows: const [
        BoxShadow(
          color: Colors.black,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      leftBarIndicatorColor: Colors.green[200],
    ).show(context); // Return the Future from show()
  }

}