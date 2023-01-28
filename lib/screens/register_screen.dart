
import 'package:flutter/material.dart';
import 'package:task_management_app/widgets/background_image.dart';
import 'package:task_management_app/widgets/reusable_elevated_button.dart';
import 'package:task_management_app/widgets/text_style.dart';

import '../widgets/textfiled_input_decoration.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Join With Us',style:pageTitleTextStyle(),),
                  SizedBox(height: 24,),
                  const SizedBox(height: 8,),
                  TextField(
                    decoration: textFiledinputDecoration('Email'),
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    decoration: textFiledinputDecoration('First Name'),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    decoration: textFiledinputDecoration('Last Name'),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    decoration: textFiledinputDecoration('Mobile'),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    obscureText: true,
                    decoration: textFiledinputDecoration('Password'),
                  ),

                  SizedBox(height: 24,),

                  ReusableElevattedButton(onTap: (){}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an Account?"),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Sign In"))

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
