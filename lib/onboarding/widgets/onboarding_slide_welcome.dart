import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWelcomeSlide extends StatelessWidget {
  const OnboardingWelcomeSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 150,
          ),
          Image.asset(
            'assets/welcome_qr_onboarding.gif',
          ),
          const SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Welcome to MyQR\n',
              style: GoogleFonts.openSans(
                  textStyle:
                      const TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
