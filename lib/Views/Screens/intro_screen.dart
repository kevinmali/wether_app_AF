import 'package:flutter/material.dart';
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
      appBar: AppBar(),
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
                        image: AssetImage(""), fit: BoxFit.fill)),
              ),
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
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
        done: Text("done"),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'Splash');
        },
        next: Text("Next"),
        showNextButton: true,
      ),
    );
  }
}