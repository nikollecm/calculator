import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/calculator_state.dart';
import '../services/calculator_service.dart';
import '../widgets/calculator_button.dart';
import '../widgets/calculator_display.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorState _state = CalculatorState();

  void _onButtonTap(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _state.clear();
      } else if (buttonText == "DEL") {
        _deleteLastCharacter();
      } else if (CalculatorService.isOperator(buttonText)) {
        _handleOperator(buttonText);
      } else if (buttonText == ".") {
        _handleDecimal();
      } else if (buttonText == "RESULT") {
        _handleResult();
      } else {
        _handleNumber(buttonText);
      }
    });
  }

  void _handleOperator(String operator) {
    if (_state.firstNumber.isNotEmpty && _state.display.isNotEmpty) {
      _calculate();
    }
    _state.firstNumber = _state.display;
    _state.operation = operator;
    _state.display = '';
  }

  void _handleDecimal() {
    if (!_state.display.contains(".")) {
      _state.display = _state.display.isEmpty ? '0.' : '${_state.display}.';
    }
  }

  void _handleResult() {
    if (_state.firstNumber.isNotEmpty &&
        _state.display.isNotEmpty &&
        _state.operation.isNotEmpty) {
      _state.secondNumber = _state.display;
      _calculate();
      _state.firstNumber = '';
      _state.operation = '';
    }
  }

  void _handleNumber(String number) {
    if (_state.display.length >= 10) return;

    if (_state.display == '0') {
      _state.display = number;
    } else {
      _state.display += number;
    }
  }

  void _calculate() {
    try {
      double a = double.parse(_state.firstNumber);
      double b = double.parse(_state.display.isEmpty ? '0' : _state.display);

      double? result = CalculatorService.calculate(_state.operation, a, b);

      if (result == null) {
        _state.display = '';
        return;
      }

      _state.display = CalculatorService.formatResult(result);
    } catch (e) {
      _state.display = '';
    }
  }

  void _deleteLastCharacter() {
    if (_state.display.length > 1) {
      _state.display = _state.display.substring(0, _state.display.length - 1);
    } else {
      _state.display = '0';
    }
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
              CalculatorDisplay(display: _state.display),
            ],
          ),
          _buildButtonRow(['C', 'DEL', '%', '/']),
          _buildButtonRow(['7', '8', '9', '-']),
          _buildButtonRow(['4', '5', '6', '+']),
          _buildButtonRow(['1', '2', '3', 'X']),
          _buildButtonRow(['0', '.', 'RESULT']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map((text) => SizedBox(
                child: CalculatorButton(
                  text: text,
                  onPressed: () => _onButtonTap(text),
                ),
              ))
          .toList(),
    );
  }
}
