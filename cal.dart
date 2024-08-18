import 'dart:io';

void main() {
  stdout.write('Enter the first number: ');
  double? num1 = double.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Enter the second number: ');
  double? num2 = double.tryParse(stdin.readLineSync() ?? '');

  if (num1 == null || num2 == null) {
    print('Please enter valid numbers.');
    return;
  }

  stdout.write('Enter an operation (+, -, *, /): ');
  String? operation = stdin.readLineSync();

  switch (operation) {
    case '+':
      print('Result: ${num1 + num2}');
      break;
    case '-':
      print('Result: ${num1 - num2}');
      break;
    case '*':
      print('Result: ${num1 * num2}');
      break;
    case '/':
      if (num2 == 0) {
        print('Error: Division by zero is not allowed.');
      } else {
        print('Result: ${num1 / num2}');
      }
      break;
    default:
      print('Invalid operation. Please use +, -, *, or /.');
  }
}
