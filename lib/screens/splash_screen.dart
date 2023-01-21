
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      goToLoginScreen();
    });



  }

  void goToLoginScreen(){
    Future.delayed(Duration(seconds: 2)).
    then((value) {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
        SvgPicture.asset(
          'assests/images/background.svg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
          Center(
            child: SvgPicture.asset('assests/images/logo.svg'),
          )
          
        ]

      ),
    );
  }


}
