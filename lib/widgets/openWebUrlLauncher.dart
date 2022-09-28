import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget WebUrlLauncher(){
  var gitHubUrl = "https://github.com/2000abilash";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(width: 10,),
      Text("${gitHubUrl}",
        style: TextStyle(
          color: Colors.indigo.shade700,
          fontSize:13,
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
          child: Icon(Icons.web),
        ),
        onTap: (){
          launch('${gitHubUrl}');
        },
      ),
      // SizedBox(width: 10,),
    ],
  );
}