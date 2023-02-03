import 'package:flutter/material.dart';
import 'package:task_management_app/screens/add_new_task_screen.dart';
import 'package:task_management_app/screens/cancel_task_screen.dart';
import 'package:task_management_app/screens/completed_task_screen.dart';
import 'package:task_management_app/screens/forget_password_screen.dart';
import 'package:task_management_app/screens/inprogress_task_screen.dart';
import 'package:task_management_app/screens/login_screen.dart';
import 'package:task_management_app/screens/main_bottom_navbar.dart';
import 'package:task_management_app/screens/new_task_screen.dart';
import 'package:task_management_app/screens/pin_verification_screen.dart';
import 'package:task_management_app/screens/profile_update_screen.dart';
import 'package:task_management_app/screens/register_screen.dart';
import 'package:task_management_app/screens/set_password_screen.dart';
import 'package:task_management_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        ForgetPassWordScreen.routeName:(context)=>ForgetPassWordScreen(),
        PinVerificationScreen.routeName:(context)=>PinVerificationScreen(),
        SetPassWordScreen.routeName:(context)=>SetPassWordScreen(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        MainBottomNavBar.routeName:(context)=>MainBottomNavBar(),
        NewTaskScreen.routeName:(context)=>NewTaskScreen(),
        CompletedTaskScreen.routeName:(context)=>CompletedTaskScreen(),
        CancelTaskScreen.routeName:(context)=>CancelTaskScreen(),
        InProgressTaskScreen.routeName:(context)=>const InProgressTaskScreen(),
        ProfileUpdateScreen.routeName:(context)=>const ProfileUpdateScreen(),
        AddNewTaskScreen.routeName:(context)=>const AddNewTaskScreen(),




      },
    );
  }
}

