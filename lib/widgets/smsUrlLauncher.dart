import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget SmsUrlLauncher(){
  var phoneNo = "+91 9487106417";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(width: 10,),
      Text("${phoneNo}",
        style: TextStyle(
          color: Colors.indigo.shade700,
          fontSize:16,
        ),
      ),
      SizedBox(width: 30,),
      InkWell(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(Icons.sms_outlined),
        ),
        onTap: (){
          launch('sms:${phoneNo}?body=Hi welcome to learn functions in flutter....');
        },
      ),
      // SizedBox(width: 10,),
    ],
  );
}