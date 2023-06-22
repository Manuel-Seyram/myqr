import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myqr/homepage.dart';
import 'package:myqr/onboarding/widgets/onboarding_slide_1.dart';
import 'package:myqr/onboarding/widgets/onboarding_slide_2.dart';

import 'widgets/onboarding_slide_welcome.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  List colors = [Colors.white, Colors.white, Colors.white];
  final List<Widget> _pages = [
    const OnboardingWelcomeSlide(),
    const OnboardingSlide1(),
    const OnboardingSlide2(),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 250, 100),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.9, 5.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 280.0,
                  ),
                ],
              ),
              const SizedBox(height: 670),
              Container(
                  decoration: BoxDecoration(color: colors[_currentPage]),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30.0,
                      ),
                      Row(
                          children:
                              List<Widget>.generate(_pages.length, (int index) {
                        return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 7,
                            width: (index == _currentPage) ? 40 : 7,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (index == _currentPage)
                                    ? const Color.fromRGBO(216, 191, 216, 1)
                                    : Colors.black));
                      })),
                      const SizedBox(
                        width: 200.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_currentPage == _pages.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          }
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn,
                          );
                        },
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            width: 100.0,
                            height: 50.0,
                          ),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                  _currentPage == _pages.length - 1
                                      ? "Get Started"
                                      : "Next",
                                  style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
