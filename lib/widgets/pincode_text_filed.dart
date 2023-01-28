

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

PinCodeTextField pinVerificationFiled(BuildContext context) {
  final TextEditingController pinTextEditingController = TextEditingController();
  return PinCodeTextField(
    length: 6,
    obscureText: false,
    animationType: AnimationType.fade,
    pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.pink,
        inactiveColor: Colors.black,
        activeColor: Colors.grey,
        selectedFillColor: Colors.white70,
        inactiveFillColor: Colors.white),
    animationDuration: Duration(milliseconds: 300),
    backgroundColor: Colors.white,
    cursorColor: Colors.black,
    enableActiveFill: true,
    controller: pinTextEditingController,
    onCompleted: (v) {
      print("Completed");
    },
    onChanged: (value) {
      print(value);
      /* setState(() {
                currentText = value;
              });*/
    },
    appContext: context,
  );
}