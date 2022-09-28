import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:success_api/screens/SplashScreen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Splash(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
   themeMode: ThemeMode.system,
   debugShowCheckedModeBanner: false,
   home: Splash(),
 );
  }
}
