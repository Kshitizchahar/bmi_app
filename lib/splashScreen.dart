// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names, non_constant_identifier_names

import 'dart:async';

import 'package:bmi_app/bmiCalculator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BmiCalculator()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff84fab0), Color(0xff8fd3f4)],
                begin: FractionalOffset(0.5, 0.0),
                end: FractionalOffset(0.0, 0.5))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style: GoogleFonts.italiana(
                    fontSize: 34, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
