import 'dart:io';

class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw FormatException("Cannot divide by zero");
    }
    return a / b;
  }
}

void main() async {
  final calculator = Calculator();
  double result;

  try {
    print("Enter the first number:");
    double num1 = double.parse(stdin.readLineSync()!);

    print("Enter the operator (+, -, *, /):");
    String operator = stdin.readLineSync()!;

    print("Enter the second number:");
    double num2 = double.parse(stdin.readLineSync()!);

    switch (operator) {
      case '+':
        result = calculator.add(num1, num2);
        break;
      case '-':
        result = calculator.subtract(num1, num2);
        break;
      case '*':
        result = calculator.multiply(num1, num2);
        break;
      case '/':
        result = calculator.divide(num1, num2);
        break;
      default:
        throw FormatException("Invalid operator: $operator");
    }
  } catch (e) {
    if (e is FormatException) {
      print("Error: ${e.message}");
    } else {
      print("An unexpected error occurred: $e");
    }
    return;
  }

  // Print the result after a 5-second delay
  await Future.delayed(Duration(seconds: 5));

  print("Result: $result");
}
