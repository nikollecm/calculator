class CalculatorLogic {
  String _firstNumber = '';
  String _secondNumber = '';
  String _display = '0';
  String _operation = '';

  String get display => _display;

  void handleInput(String input) {
    if (input == "C") {
      _clear();
    } else if (input == "DEL") {
      _deleteLastCharacter();
    } else if (_isOperator(input)) {
      _handleOperator(input);
    } else if (input == ".") {
      _handleDecimal();
    } else if (input == "RESULT") {
      _calculateResult();
    } else {
      _handleNumber(input);
    }
  }

  void _clear() {
    _firstNumber = '';
    _secondNumber = '';
    _display = '0';
    _operation = '';
  }

  void _deleteLastCharacter() {
    if (_display.length > 1) {
      _display = _display.substring(0, _display.length - 1);
    } else {
      _display = '0';
    }
  }

  bool _isOperator(String input) {
    return input == "+" || input == "-" || input == "/" || input == "X" || input == "%";
  }

  void _handleOperator(String operator) {
    if (_firstNumber != '' && _display != '') {
      _calculate();
    }
    _firstNumber = _display;
    _operation = operator;
    _display = '';
  }

  void _handleDecimal() {
    if (!_display.contains(".")) {
      _display = _display.isEmpty ? '0.' : '$_display.';
    }
  }

  void _handleNumber(String number) {
    if (_display.length >= 10) return;

    if (_display == '0') {
      _display = number;
    } else {
      _display += number;
    }
  }

  void _calculateResult() {
    if (_firstNumber != '' && _display != '' && _operation != '') {
      _secondNumber = _display;
      _calculate();
      _firstNumber = '';
      _operation = '';
    }
  }

  void _calculate() {
    try {
      double a = double.parse(_firstNumber);
      double b = double.parse(_display.isEmpty ? '0' : _display);
      double result = 0;

      switch (_operation) {
        case '+':
          result = a + b;
          break;
        case '-':
          result = a - b;
          break;
        case 'X':
          result = a * b;
          break;
        case '/':
          if (b == 0) {
            _display = 'Error';
            return;
          }
          result = a / b;
          break;
        case '%':
          result = a * b / 100;
          break;
      }

      _display = result % 1 == 0 ? result.toInt().toString() : result.toString();
    } catch (e) {
      _display = 'Error';
    }
  }
}
