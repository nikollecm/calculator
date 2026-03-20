import 'package:flutter/material.dart';
import '../constants/app_styles.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.buttonText,
      ),
    );
  }
}
