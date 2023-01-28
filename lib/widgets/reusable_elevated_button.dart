
import 'package:flutter/material.dart';

class ReusableElevattedButton extends StatelessWidget {
  const ReusableElevattedButton({
    Key? key, required this.onTap,this.text
  }) : super(key: key);

  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed:onTap ,
            child: text!=null? Text(text!):
            Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)));
  }
}