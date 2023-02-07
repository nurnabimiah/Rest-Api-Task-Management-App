
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/network_services/network_requester.dart';
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





  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    Text('Join With Us',style:pageTitleTextStyle(),),
                    SizedBox(height: 24,),
                    const SizedBox(height: 8,),

                    TextFormField(
                      controller: _emailController,
                      decoration: textFiledinputDecoration('Email'),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                    ),


                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: textFiledinputDecoration('First Name'),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: textFiledinputDecoration('Last Name'),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _mobileController,
                      decoration: textFiledinputDecoration('Mobile'),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _passWordController,
                      obscureText: true,
                      decoration: textFiledinputDecoration('Password'),
                      validator: (value){
                        if(value==null || value.isEmpty && value.length!=6){
                          return 'Password Must be 6 character';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 24,),

                    ReusableElevattedButton(onTap: () async {
                      if(_form.currentState!.validate()){
                      final result =  await  NetworkRequester().postRequest('https://task.teamrabbil.com/api/v1/registration',{
                          "email":_emailController.text,
                          "firstName":_firstNameController.text,
                          "lastName": _lastNameController.text,
                          "mobile":_mobileController.text,
                          "password":_passWordController.text,
                          "photo":""

                        });
                       if(result['status']== 'success'){
                         /*
                         * share preference er maddome amra decison nei
                         * login kora ase kina
                         * */
                        /* final sharePrefs = await SharedPreferences.getInstance();
                         sharePrefs.setString('gmail', result['data']['email']);
                         sharePrefs.setString('gmail', result['data']['firstName']);
                         sharePrefs.setString('gmail', result['data']['lastName']);
                         sharePrefs.setString('token', result['token']);*/

                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registraction sucessful')));
                       }
                       /*
                       * jokn registraction ta complete hoye jabe tokhon amra
                       * textform filed golo k dispose kore dibo
                       * */
                      _emailController.text = '';
                      _firstNameController.text = '';
                      _lastNameController.text = '';
                      _mobileController.text ='';
                      _passWordController.text = '';

                      print(result);

                      }
                    }),
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
      ),
    );
  }
}
