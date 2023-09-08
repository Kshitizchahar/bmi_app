// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.poppins(
            color: Colors.deepPurple,
            fontSize: MediaQuery.of(context).size.height * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      children: [
                        TextField(
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          controller: wtController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              label: Text("Enter the weight (kg)"),
                              labelStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(Icons.line_weight)),
                        ),
                        TextField(
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          controller: ftController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              label: Text("Enter the height (ft)"),
                              labelStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(Icons.height)),
                        ),
                        TextField(
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          controller: inController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("Enter the height (in)"),
                            labelStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(Icons.height),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent),
                          onPressed: () {
                            var wt = wtController.text.toString();
                            var ft = ftController.text.toString();
                            var inch = inController.text.toString();

                            setState(() {
                              if (wt != "" && ft != "" && inch != "") {
                                var iwt = int.parse(wt);
                                var ift = int.parse(ft);
                                var iinch = int.parse(inch);

                                var tinch = (ift * 12) + iinch;
                                var tmeter = tinch * 0.0254;

                                var bmi = iwt / (tmeter * tmeter);

                                var msg = "";

                                if (bmi < 18.5) {
                                  msg = "You are Underweight.";
                                  bgColor = Colors.blue[300];
                                } else if (bmi >= 18.5 && bmi < 25) {
                                  msg = "You are Normal";
                                  bgColor = Colors.green[300];
                                } else if (bmi >= 25 && bmi < 30) {
                                  msg = "You have a little Overweight";
                                  bgColor = Colors.yellow[600];
                                } else if (bmi >= 30 && bmi < 35) {
                                  msg = "You are Obese ";
                                  bgColor = Colors.orange[600];
                                } else {
                                  msg = " You Are Severely Obese";
                                  bgColor = Colors.redAccent[600];
                                }

                                result =
                                    "$msg \n Your Bmi is: ${bmi.toStringAsFixed(2)}";
                              } else {
                                result = "Please fill all the required fields";
                              }
                            });
                          },
                          child: Text(
                            "Calculate",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    result,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Image.asset("assets/images/bmichart.png"))
                ],
              ),
            ),
          )),
    );
  }
}
