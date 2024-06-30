import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/controller/logininfo.dart';
import 'package:musicapp/view/splash.dart';
import 'package:musicapp/view/signUpScreen.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwardTextEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                "asset/images/icon.png",
                height: 200,
                width: 1200,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: usernameTextEditingController,
                decoration: InputDecoration(
                    hintText: "Enter username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: const Icon(Icons.person)),
                // validator: (value) {
                //   print("in username validator");
                //   if (value == null || value.isEmpty) {
                //     return "Please Enter username";
                //   } else {
                //     return null;
                //   }
                // },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwardTextEditingController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter passward",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                ),
                // validator: (value) {
                //   print("in passward validator");
                //   if (value == null || value.isEmpty) {
                //     return "Please Enter passward";
                //   } else {
                //     return null;
                //   }
                // },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {

                    String username = usernameTextEditingController.text;
                    String passward=passwardTextEditingController.text;
                    String mob="123456789";
                  bool isLoginInfocorrect= LoginInfo().isLoginInfocorrect(username: username, passward: passward); 

                  if(isLoginInfocorrect){

                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                      return Home();

                    }));
                  }
                  },
                  
                  style: ElevatedButton.styleFrom(
                    
                      fixedSize: Size(350, 50),
                      backgroundColor: Color.fromRGBO(33, 101, 246, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  )),
                  SizedBox( height: 200,),

                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Don't have an Account?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),

                    SizedBox( width: 7,),
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                      return Signup();

                    }));
                
                      },
                      child: const Text("SignUp",style: TextStyle(color: Color.fromRGBO(32, 83, 236, 1),fontSize: 15,fontWeight: FontWeight.w600),),
                      
                    )


                  ],),

                  
            ],
          ),
        ),
      ),
    );
  }
}
