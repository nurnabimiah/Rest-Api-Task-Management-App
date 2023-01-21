
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
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
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assests/images/background.svg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get Started With',style: TextStyle(fontWeight: FontWeight.w600,fontSize:25 ),),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                      validator: (String? text){
                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'password',
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                      validator: (String? text){
                        return null;
                      },
                    ),
                    const SizedBox(height: 12,),
                    SizedBox(
                         width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: (){},
                            child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,))),
                    const SizedBox(height: 16,),
                    Center(child: TextButton(onPressed: (){}, child: Text("Forget Password ?"))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Don't Have an Account ?"),
                       TextButton(onPressed: (){}, child: Text("Sign Up"))

                     ],
                    )

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
