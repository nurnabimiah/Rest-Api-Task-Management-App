
import 'package:flutter/material.dart';
import 'package:task_management_app/screens/login_screen.dart';
import 'package:task_management_app/screens/pin_verification_screen.dart';
import 'package:task_management_app/widgets/background_image.dart';
import 'package:task_management_app/widgets/reusable_elevated_button.dart';
import 'package:task_management_app/widgets/text_style.dart';

import '../widgets/reusable_text_button.dart';
import '../widgets/textfiled_input_decoration.dart';


class ForgetPassWordScreen extends StatefulWidget {

  static const String routeName = '/forgetPassword_screen';

  const ForgetPassWordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassWordScreen> createState() => _ForgetPassWordScreenState();
}

class _ForgetPassWordScreenState extends State<ForgetPassWordScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Email Address',style: pageTitleTextStyle(),),
                const SizedBox(height: 8,),
                Text('A 6 digit verification code will be sent to your email address',
                  style: subTitleTextStyle()
                ),

                const SizedBox(height: 16,),
                TextFormField(
                  controller: _emailController,
                  decoration: textFiledinputDecoration('Email'),
                  validator: (String? text){
                    return null;
                  },
                ),
                
                const SizedBox(height: 27,),
                ReusableElevattedButton(onTap: (){
                  Navigator.pushNamed(context, PinVerificationScreen.routeName);
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
      ),
    );
  }
}
