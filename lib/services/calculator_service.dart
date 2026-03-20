class CalculatorService {
  static double? calculate(String operation, double a, double b) {
    switch (operation) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case 'X':
        return a * b;
      case '/':
        return b == 0 ? null : a / b;
      case '%':
        return a * b / 100;
      default:
        return null;
    }
  }

  static String formatResult(double result) {
    return result % 1 == 0 ? result.toInt().toString() : result.toString();
  }

  static bool isOperator(String text) {
    return ['+', '-', '/', 'X', '%'].contains(text);
  }
}
