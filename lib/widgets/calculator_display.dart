import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class CalculatorDisplay extends StatelessWidget {
  final String display;

  const CalculatorDisplay({
    super.key,
    required this.display,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: AppColors.displayBackground,
        border: Border.all(color: AppColors.primary, width: 4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          display,
          style: AppStyles.displayText,
        ),
      ),
    );
  }
}
