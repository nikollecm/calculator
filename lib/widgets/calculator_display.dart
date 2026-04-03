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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.displayBackground,
          border: Border.all(color: AppColors.primary, width: 4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              display,
              style: AppStyles.displayText,
            ),
          ),
        ),
      ),
    );
  }
}
