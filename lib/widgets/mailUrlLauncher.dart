import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget MailUrlLauncher(){
  var mail = "abilashge@gmail.com";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(width: 10,),
      Text("${mail}",
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
          child: Icon(CupertinoIcons.mail),
        ),
        onTap: (){
          launch('mailto:${mail}?body=Hi welcome to learn functions in flutter....');
        },
      ),
      // SizedBox(width: 10,),
    ],
  );
}