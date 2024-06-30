import 'package:flutter/material.dart';
import 'package:musicapp/view/splash.dart';
import 'package:musicapp/view/gallary_screen.dart';
import 'package:musicapp/view/login_Screen.dart';
import 'package:musicapp/view/splashscrren.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


