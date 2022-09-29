import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:success_api/screens/homeScreen.dart';
import 'package:success_api/services/apiServices.dart';
import 'package:success_api/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController=TextEditingController(text: "mor_2314");
  TextEditingController passwordController=TextEditingController(text: "83r5^_");

  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 160,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.white,
                height: 220,
                width: 220,
                child: Lottie.asset("assets/images/lootie_animation.json"),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2,color: Colors.orange.shade500),
          color: Colors.orangeAccent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField (
          style: TextStyle(
            color:Colors.white,
          ),
          controller: usernameController,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.person,color: Colors.white,),
              border: InputBorder.none,
              // labelText: 'Email',
              hintText: 'Enter Your Email',
          ),
        ),
      ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2,color: Colors.deepOrange.shade400),
              color: Colors.deepOrangeAccent,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField (
              obscureText: isPassword,
              style: TextStyle(
                color:Colors.white,
              ),
              controller: passwordController,
              decoration: InputDecoration(
                suffixIcon:InkWell(
                  onTap: (){
                    setState((){
                      isPassword=!isPassword;
                    });
                  },
                  child: isPassword?Icon(Icons.lock,color: Colors.white,):Icon(Icons.lock_open,color: Colors.white,),
                ),
                border: InputBorder.none,
                // labelText: 'Email',
                hintText: 'Enter Password',
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 40,
              width: 160,
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
                border: Border.all(width: 2,color: Colors.green.shade400)
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LOGIN",style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:18
                  ),),
                ],
              ),
            ),


    onTap: () async {
      final getToken = await RemoteService().loginApi(
          usernameController.text, passwordController.text);
      print(getToken);
      if (
      getToken!["token"] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Success But cannot go inside because I commented navigator (Using of google Sign In) !"),
              backgroundColor: Colors.green,));
        // Future.delayed(Duration(seconds:2), () {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
        // });
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid User Name or Password !"),
              backgroundColor: Colors.red,));
        print("Invalid User Name or Password");
      }
    }
          ),




          SizedBox(height: 10,),
          Text("Or",style: TextStyle(
            fontSize: 16
          ),),
          SizedBox(height: 10,),

          Container(
            height: 46,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(50),
            ),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // color: Colors.white,
                    height: 40,
                    width: 40,
                    child: Lottie.asset("assets/images/google_logo.json",
                        fit: BoxFit.cover
                    ),
                  ),
                  Text("SignIn with Google",style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:18
                  ),),
                ],
              ),
              onTap: () async {
                AuthService().signInWithGoogle();
              },
            ),
          ),

      ],
      )
    );
  }
}
