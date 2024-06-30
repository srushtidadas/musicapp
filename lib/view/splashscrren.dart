import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musicapp/view/login_Screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  State createState() => _SplashState();
}

class _SplashState extends State {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/images/icon.png",
              height: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Application")
          ],
        ),
      ),
    );
  }
}
