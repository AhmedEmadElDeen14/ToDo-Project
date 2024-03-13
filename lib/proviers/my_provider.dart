import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/user_model.dart';

class MyProvider extends ChangeNotifier{

  UserModel? userModel;
  User? firebaseUser;

  MyProvider(){
    firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initUser();
    }
  }

  initUser() async{
    userModel=await FirebaseFunctions.readUser();
    notifyListeners();
  }

}