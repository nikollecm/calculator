import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/app_styles.dart';
import 'screens/calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Calculator', style: AppStyles.appBarTitle),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
        body: const CalculatorScreen(),
      ),
    );
  }
}
