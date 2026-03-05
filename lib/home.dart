import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFD0DB),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Calculator',
                style: GoogleFonts.jersey15(
                  textStyle: TextStyle(fontSize: 50, color: Color(0xffD56989)),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
        body: CalculatorApp(),
      ),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  static const Color kPink = Color(0xffD56989);

  String firstNumber = '';
  String secondNumber = '';
  String display = '0';
  String operation = '';

  void onButtonTap(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        firstNumber = '';
        secondNumber = '';
        display = '0';
        operation = '';
      } else if (buttonText == "DEL") {
        deleteLastCharacter();
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "/" ||
          buttonText == "X" ||
          buttonText == "%") {
        if (firstNumber != '' && display != '') {
          _calculate();
        }
        firstNumber = display;
        operation = buttonText;
        display = '';
      } else if (buttonText == ".") {
        if (!display.contains(".")) {
          display = display.isEmpty ? '0.' : '$display.';
        }
      } else if (buttonText == "RESULT") {
        if (firstNumber != '' && display != '' && operation != '') {
          secondNumber = display;
          _calculate();
          firstNumber = '';
          operation = '';
        }
      } else {
        if (display.length >= 10) return;

        if (display == '0') {
          display = buttonText;
        } else {
          display += buttonText;
        }
      }
    });
  }

  void _calculate() {
    try {
      double a = double.parse(firstNumber);
      double b = double.parse(display.isEmpty ? '0' : display);
      double result = 0;

      if (operation == '+') {
        result = a + b;
      } else if (operation == '-') {
        result = a - b;
      } else if (operation == 'X') {
        result = a * b;
      } else if (operation == '/') {
        if (b == 0) {
          display = '';
          return;
        }
        result = a / b;
      } else if (operation == '%') {
        result = a * b / 100;
      }

      display = result % 1 == 0 ? result.toInt().toString() : result.toString();
    } catch (e) {
      display = '';
      return;
    }
  }

  void deleteLastCharacter() {
    setState(() {
      if (display.length > 1) {
        display = display.substring(0, display.length - 1);
      } else {
        display = '0';
      }
    });
  }

  Widget buttonPressed(String buttonText) {
    return ElevatedButton(
      onPressed: () => onButtonTap(buttonText),
      child: Text(
        buttonText,
        style: GoogleFonts.jersey15(
          textStyle: TextStyle(fontSize: 40, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPink, width: 4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    display,
                    style: GoogleFonts.jersey15(
                      textStyle: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(child: buttonPressed('C')),
              SizedBox(child: buttonPressed('DEL')),
              SizedBox(child: buttonPressed('%')),
              SizedBox(child: buttonPressed('/')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(child: buttonPressed('7')),
              SizedBox(child: buttonPressed('8')),
              SizedBox(child: buttonPressed('9')),
              SizedBox(child: buttonPressed('-')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(child: buttonPressed('4')),
              SizedBox(child: buttonPressed('5')),
              SizedBox(child: buttonPressed('6')),
              SizedBox(child: buttonPressed('+')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(child: buttonPressed('1')),
              SizedBox(child: buttonPressed('2')),
              SizedBox(child: buttonPressed('3')),
              SizedBox(child: buttonPressed('X')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(child: buttonPressed('0')),
              SizedBox(child: buttonPressed('.')),
              SizedBox(child: buttonPressed('RESULT')),
            ],
          ),
        ],
      ),
    );
  }
}
