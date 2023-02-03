

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/background_image.dart';
import '../widgets/reusable_appbar.dart';
import '../widgets/reusable_elevated_button.dart';
import '../widgets/text_style.dart';
import '../widgets/textfiled_input_decoration.dart';

class ProfileUpdateScreen extends StatefulWidget {
  static const String routeName = '/profile_update_screen';
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {

  XFile? photofile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(context,isTapable: false),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(32.0),

          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Update Profile',style:pageTitleTextStyle(),),
                  SizedBox(height: 24,),
                  InkWell(
                    onTap: () async {
                      final ImagePicker image_picker = ImagePicker();
                     final result = await image_picker.pickImage(source: ImageSource.gallery);
                     if(result!=null){
                       setState((){
                         photofile = result;
                       });

                     }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(color: Colors.grey),
                            child: const Text('Photo',style: TextStyle(color: Colors.white),),
                          ),
                          //
                          //
                          // er mane holo photo file er ekta name dekhabe na hoy empty string dekhabe
                          //
                          //
                          //Image.file(File(photofile?.path ?? '',),height: 30,width: 30,),
                          
                          //
                          //
                          // photofile ta jodi null thake taheole se null na niye faka '' string a chole jabe

                          Expanded(child: Text(photofile?.name ?? '',maxLines: 2,),)

                          // er mane bujay nullable na thakle photofile.name ta dekhabe


                        ],
                      ),
                    ),
                  ),
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

                  ReusableElevattedButton(onTap: (){},text:'Update',),


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
