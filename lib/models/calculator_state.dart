class CalculatorState {
  String firstNumber;
  String secondNumber;
  String display;
  String operation;

  CalculatorState({
    this.firstNumber = '',
    this.secondNumber = '',
    this.display = '0',
    this.operation = '',
  });

  void clear() {
    firstNumber = '';
    secondNumber = '';
    display = '0';
    operation = '';
  }

  CalculatorState copyWith({
    String? firstNumber,
    String? secondNumber,
    String? display,
    String? operation,
  }) {
    return CalculatorState(
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      display: display ?? this.display,
      operation: operation ?? this.operation,
    );
  }
}
