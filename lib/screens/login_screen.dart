
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/screens/forget_password_screen.dart';
import 'package:task_management_app/screens/main_bottom_navbar.dart';
import 'package:task_management_app/screens/register_screen.dart';
import 'package:task_management_app/widgets/background_image.dart';

import '../widgets/reusable_elevated_button.dart';
import '../widgets/text_style.dart';
import '../widgets/textfiled_input_decoration.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child:  SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get Started With',style: pageTitleTextStyle(),),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _emailController,
                    decoration: textFiledinputDecoration('Email'),
                    validator: (String? text){
                      return null;
                    },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: textFiledinputDecoration("Password"),
                    validator: (String? text){
                      return null;
                    },
                  ),
                  const SizedBox(height: 12,),
                  ReusableElevattedButton(
                    onTap: (){
                     // Navigator.pushNamed(context,MainBottomNavBar.routeName);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainBottomNavBar()), (route) => false);
                    },
                  ),
                  const SizedBox(height: 16,),
                  Center(child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, ForgetPassWordScreen.routeName);
                  }, child: Text("Forget Password ?"))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account ?"),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      }, child: Text("Sign Up"))

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      )
    );
  }




}


