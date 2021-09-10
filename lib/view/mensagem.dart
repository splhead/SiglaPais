import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


mixin Mensagem {
  void showMensagem(String msg, {duration, gravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: duration ?? Toast.LENGTH_LONG,
        gravity: gravity ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlue,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}