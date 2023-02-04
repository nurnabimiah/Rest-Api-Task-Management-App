import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/screens/forget_password_screen.dart';
import 'package:task_management_app/screens/main_bottom_navbar.dart';
import 'package:task_management_app/screens/register_screen.dart';
import 'package:task_management_app/widgets/background_image.dart';

import '../network_services/network_requester.dart';
import '../utils/user_data.dart';
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

  final _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundImage(
      child: SafeArea(
        child: Form(
          key: _loginForm,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Started With',
                  style: pageTitleTextStyle(),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: textFiledinputDecoration('Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filed must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: textFiledinputDecoration("Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filed must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                ReusableElevattedButton(
                  onTap: () async {
                    if (_loginForm.currentState!.validate()) {
                      final result = await NetworkRequester().postRequest('https://task.teamrabbil.com/api/v1/login', {
                        "email": _emailController.text,
                        "password": _passwordController.text,
                        "photo": ""
                      });

                      print(result);
                      if(result['status']== 'success'){
                        /*
                         * share preference er maddome amra decison nei
                         * login kora ase kina
                         * */
                        final sharePrefs = await SharedPreferences.getInstance();
                        UserData.token = result['token'];
                        UserData.firstName = result['data']['firstName'];
                        UserData.lastName = result['data']['lastName'];
                        UserData.email = result['data']['email'];
                        UserData.phone = result['data']['mobile'];


                        sharePrefs.setString('gmail', result['data']['email']);
                        sharePrefs.setString('firstName', result['data']['firstName']);
                        sharePrefs.setString('lastName', result['data']['lastName']);
                        sharePrefs.setString('token', result['token']);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainBottomNavBar()),
                                (route) => false);
                      }
                      else{
                        ScaffoldMessenger.of(context,).showSnackBar(
                            SnackBar(content: const Text('Email or Password is wrong')));
                      }
                    }


                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgetPassWordScreen.routeName);
                        },
                        child: Text("Forget Password ?"))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an Account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
