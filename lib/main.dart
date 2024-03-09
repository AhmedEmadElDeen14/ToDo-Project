import 'package:flutter/material.dart';
import 'package:todo_app/edit_task.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        HomeScreen.routeName :  (context) => HomeScreen(),
        EditTask.routeName :  (context) => EditTask(),
      },
    );
  }
}


