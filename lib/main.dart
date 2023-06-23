import 'package:flutter/material.dart';
import 'package:myqr/onboarding/oboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
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
    home: isFirstLaunch ? Onboarding() : Homepage(), 
  ));
}



