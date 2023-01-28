
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/screens/login_screen.dart';

import '../widgets/background_image.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = '/splash_screen';
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
      body: BackgroundImage(
        child:  Center(
          child: SvgPicture.asset('assests/images/logo.svg'),
        ),
      ),
    );
  }


}

