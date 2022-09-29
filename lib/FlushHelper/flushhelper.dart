
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class FlushHelper{

  static Future<int> showFlushBarMessage(context, message, type,{Color? color}) async {
    Flushbar(
      borderRadius: BorderRadius.circular(10),
      maxWidth: MediaQuery
          .of(context)
          .size
          .width - 50,
      forwardAnimationCurve: Curves.fastOutSlowIn,
      reverseAnimationCurve: Curves.easeIn,
      message: message,
      // titleText: Text(title,style: poppins_fs16_wbold_black,),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 3),
      backgroundColor:color??Colors.indigoAccent,
    ).show(context);
    if (type == 'sound') {
      // audioCache.play('audio1.mp3');
    }
    return 1;
  }}
