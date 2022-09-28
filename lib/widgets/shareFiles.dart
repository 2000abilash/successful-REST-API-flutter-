import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

Widget ShareButtonWidget(){
  var gitHubUrl = "https://github.com/2000abilash";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(width: 10,),
      Text("Share Profile",
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
          child: Icon(Icons.share_outlined),
        ),
        onTap: (){
          Share.share("$gitHubUrl");
        },
      ),
      // SizedBox(width: 10,),
    ],
  );
}