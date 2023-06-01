import 'package:flutter/material.dart';
import 'package:myqr/onboarding/oboarding_screen.dart';

void main() {
  runApp( 
    MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color.fromRGBO(216, 191, 216, 1),
      focusColor: const Color.fromRGBO(216, 191, 216, 1),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromRGBO(216, 191, 216, 1),
      ),iconTheme: const IconThemeData(
        color: Color.fromRGBO(216, 191, 216, 1),
      ),
    ),
    home: const Onboarding() 
  ));
}



