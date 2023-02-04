
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/screens/login_screen.dart';
import 'package:task_management_app/screens/main_bottom_navbar.dart';
import 'package:task_management_app/utils/user_data.dart';

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

  Future<void> goToLoginScreen() async {
    final sharePrefs = await SharedPreferences.getInstance();
    final String? result = sharePrefs.getString('token');
    if(result!=null) {

      /*
      * sob kiso amder user details er modde save hoye jabe
      * jokhon isse tokhon aigola amra nite parbo
      *
      * */
      UserData.token = result;
      UserData.firstName = sharePrefs.getString('firstName');
      UserData.lastName = sharePrefs.getString('lastName');
      UserData.email = sharePrefs.getString('email');
      UserData.phone = sharePrefs.getString('phone');
      Future.delayed(Duration(seconds: 2)).
      then((value) {
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => MainBottomNavBar()), (
            route) => false);
      });
    } else{
      Future.delayed(Duration(seconds: 2)).
      then((value) {
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => LoginScreen()), (
            route) => false);
      });
    }
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

