import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/view/gallary_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  State createState() => _HomeState();
}

class _HomeState extends State {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(children: [
          SizedBox(
            height: height,
            width: width,
          ),
          Image.asset("asset/images/backg.png"),
          const Positioned(
              left: 44,
              top: 420,
              right: 40,
              child: SizedBox(
                  child: Text(
                "Dancing between The shadows               Of rhythm",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ))),
          Positioned(
            top: 600,
            left: 70,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gallary()));
              },
              child: Container(
                width: 261,
                height: 47,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 46, 0, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(
                    child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Color.fromRGBO(19, 19, 19, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )),
              ),
            ),
          ),
          Positioned(
            top: 663,
            left: 70,
            child: GestureDetector(
              child: Container(
                width: 261,
                height: 47,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Color.fromRGBO(255, 46, 0, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(
                    child: Text(
                  "Continue with Email",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 46, 0, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )),
              ),
            ),
          ),
          Positioned(
              top: 731,
              left: 88,
              right: 88,
              child: const Text(
                "by continuing you agree to terms of services and  Privacy policy",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ))
        ]),
      ),
    );
  }
}
