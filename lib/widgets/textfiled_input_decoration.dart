

import 'package:flutter/material.dart';

InputDecoration textFiledinputDecoration( hinttext) {
  return  InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: hinttext,
      border: OutlineInputBorder(borderSide: BorderSide.none)
  );
}