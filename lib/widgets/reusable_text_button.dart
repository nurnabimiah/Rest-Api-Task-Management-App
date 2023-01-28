

import 'package:flutter/material.dart';

class resuable_textButton extends StatelessWidget {
  const resuable_textButton({
    Key? key, required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text("Sign Up"));
  }
}