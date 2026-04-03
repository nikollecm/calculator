import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

enum ButtonType { number, operator, utility, result }

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool isActive;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.number,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: _textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        elevation: isActive ? 0 : 2,
      ),
      child: Text(
        text,
        style: AppStyles.buttonText.copyWith(color: _textColor),
      ),
    );
  }

  Color get _backgroundColor {
    if (isActive) return AppColors.operatorActiveButton;
    switch (type) {
      case ButtonType.number:
        return AppColors.numberButton;
      case ButtonType.operator:
        return AppColors.operatorButton;
      case ButtonType.utility:
        return AppColors.utilityButton;
      case ButtonType.result:
        return AppColors.resultButton;
    }
  }

  Color get _textColor {
    if (isActive) return AppColors.operatorActiveText;
    if (type == ButtonType.result) return AppColors.resultText;
    return AppColors.buttonText;
  }
}
