import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/controller/logininfo.dart';
import 'package:musicapp/model/Users.dart';
import 'package:musicapp/view/login_Screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignState();
}

class _SignState extends State<Signup> {
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
                height: 300,
              ),
               const Text("Create an Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              const SizedBox(height: 20),

              TextFormField(
                controller: usernameTextEditingController,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                      ),
                
              ),
              SizedBox( height: 7,),

              TextFormField(
                controller: usernameTextEditingController,
                decoration: InputDecoration(
                    hintText: "username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    ),
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
                height: 7,
              ),
              TextFormField(
                controller: passwardTextEditingController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Passward",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                
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
                height: 7,
              ),

              TextFormField(
                controller: usernameTextEditingController,
                decoration: InputDecoration(
                    hintText: "Confirm Passward",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                    
                
              ),
              SizedBox( height: 7,),
              ElevatedButton(
                  onPressed: () {
                    String username=usernameTextEditingController.text;
                    String passward=passwardTextEditingController.text;
                    String mob ="1234567";
                    Data obj=Data(username: username, passward: passward, mob:mob );
                    LoginInfo().insertUser(obj);


                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                      return Login();

                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(450, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
