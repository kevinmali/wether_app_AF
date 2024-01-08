import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_page extends StatefulWidget {
  const intro_page({super.key});

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Weather App ",
            body:
                "Welcome to Weather App.This is a description of how it Redding.",
            image: Center(
              child: Container(
                height: 460,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Asset/Images/intro1.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          ),
          PageViewModel(
            title: "Welcome to Wether App",
            body:
                "Welcome to Weather App.This is a description of how it Redding.",
            image: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Asset/Images/intro2.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          ),
        ],
        done: Text(
          "done",
          style: GoogleFonts.acme(color: Colors.black, fontSize: 20),
        ),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'Splash');
        },
        next: Text(
          "Next",
          style: GoogleFonts.acme(color: Colors.black, fontSize: 20),
        ),
        showNextButton: true,
        dotsDecorator: DotsDecorator(
          // size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.black,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
