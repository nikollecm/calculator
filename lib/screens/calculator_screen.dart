import 'package:flutter/material.dart';
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
  final CalculatorState _state = CalculatorState();

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
    if (_state.display == 'Error') return;
    if (_state.firstNumber.isNotEmpty && _state.display.isNotEmpty) {
      _calculate();
      if (_state.display == 'Error') return;
    }
    _state.firstNumber = _state.display;
    _state.operation = operator;
    _state.display = '';
  }

  void _handleDecimal() {
    if (_state.display == 'Error') return;
    if (!_state.display.contains(".")) {
      _state.display = _state.display.isEmpty ? '0.' : '${_state.display}.';
    }
  }

  void _handleResult() {
    if (_state.display == 'Error') return;
    if (_state.firstNumber.isNotEmpty &&
        _state.display.isNotEmpty &&
        _state.operation.isNotEmpty) {
      _state.secondNumber = _state.display;
      _calculate();
      _state.firstNumber = _state.display;
      _state.operation = '';
    }
  }

  void _handleNumber(String number) {
    if (_state.display == 'Error') {
      _state.clear();
    }
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
        _state.display = 'Error';
        return;
      }

      _state.display = CalculatorService.formatResult(result);
    } catch (e) {
      _state.display = 'Error';
    }
  }

  void _deleteLastCharacter() {
    if (_state.display == 'Error') {
      _state.clear();
      return;
    }
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
          CalculatorDisplay(display: _state.display),
          _buildRow([
            _btn('C', flex: 1, type: ButtonType.utility),
            _btn('DEL', flex: 2, type: ButtonType.utility),
            _btn('%', flex: 1, type: ButtonType.operator),
            _btn('/', flex: 1, type: ButtonType.operator),
          ]),
          _buildRow([
            _btn('7'),
            _btn('8'),
            _btn('9'),
            _btn('-', type: ButtonType.operator),
          ]),
          _buildRow([
            _btn('4'),
            _btn('5'),
            _btn('6'),
            _btn('+', type: ButtonType.operator),
          ]),
          _buildRow([
            _btn('1'),
            _btn('2'),
            _btn('3'),
            _btn('X', type: ButtonType.operator),
          ]),
          _buildRow([
            _btn('0'),
            _btn('.'),
            _btn('RESULT', flex: 2, type: ButtonType.result),
          ]),
        ],
      ),
    );
  }

  ({String text, int flex, ButtonType type}) _btn(
    String text, {
    int flex = 1,
    ButtonType type = ButtonType.number,
  }) => (text: text, flex: flex, type: type);

  Widget _buildRow(List<({String text, int flex, ButtonType type})> buttons) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: buttons
            .map(
              (entry) => Expanded(
                flex: entry.flex,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CalculatorButton(
                    text: entry.text,
                    type: entry.type,
                    isActive:
                        entry.type == ButtonType.operator &&
                        _state.operation == entry.text,
                    onPressed: () => _onButtonTap(entry.text),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
