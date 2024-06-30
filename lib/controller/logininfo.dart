


import 'package:musicapp/model/Users.dart';

class LoginInfo{
  void insertUser(Data data){
  Userinfo.user.addAll({data.username:data.passward});
  }

  bool isLoginInfocorrect({required String username,required String passward}){
    if (Userinfo.user.containsKey(username)&& Userinfo.user[username]==passward ){
      return true;
    

    }else{
      return false;
    }
     

  }
}