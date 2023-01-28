
import 'package:flutter/material.dart';
import 'package:task_management_app/screens/register_screen.dart';
import 'package:task_management_app/widgets/background_image.dart';
import 'package:task_management_app/widgets/reusable_elevated_button.dart';
import 'package:task_management_app/widgets/textfiled_input_decoration.dart';

import '../widgets/text_style.dart';

class SetPassWordScreen extends StatefulWidget {
  static const String routeName = '/setpassword_screen';
  @override
  State<SetPassWordScreen> createState() => _SetPassWordScreenState();
}

class _SetPassWordScreenState extends State<SetPassWordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Set Password',style: pageTitleTextStyle(),),
              Text('Minimum length password 8 character with Latter and number combination',style: subTitleTextStyle(),),
              const SizedBox(height: 24,),
              TextField(
                obscureText: true,
                 decoration: textFiledinputDecoration('New Password'),
              ),
              const SizedBox(height: 8,),
              TextField(
                obscureText: true,
                decoration: textFiledinputDecoration('Confirm Password'),
              ),

              const SizedBox(height: 24,),
              ReusableElevattedButton(
                  text: 'Confirm',
                  onTap: (){
                Navigator.pushNamed(context, RegisterScreen.routeName);
              }),
              const SizedBox(height: 27,),
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
    );
  }
}
