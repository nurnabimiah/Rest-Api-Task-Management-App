
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management_app/screens/set_password_screen.dart';
import 'package:task_management_app/widgets/background_image.dart';
import 'package:task_management_app/widgets/reusable_elevated_button.dart';

import '../widgets/pincode_text_filed.dart';
import '../widgets/text_style.dart';

class PinVerificationScreen extends StatefulWidget {
  static const String routeName = '/pinverification_screen';
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {



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
               Text('Pin Verification',style: pageTitleTextStyle(),),
             const SizedBox(height: 8,),
             Text('A 6 digit verification code will be sent to your email address',
                 style: subTitleTextStyle()
             ),
             const SizedBox(height: 32,),

            pinVerificationFiled(context),
             const SizedBox(height: 8,),
             ReusableElevattedButton(
                 text: 'Verify',
                 onTap: (){
               Navigator.pushNamed(context, SetPassWordScreen.routeName);
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
