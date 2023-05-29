import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myqr/onboarding/oboarding_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';


late int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen"))!;
  await prefs.setInt("initScreen", 1);
  if (kDebugMode) {
    print('initScreen $initScreen');
  }
  runApp( MaterialApp(
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
    home: initScreen == 0 ? const Onboarding() : const Onboarding(),
  ));
}



