// void main() {
//   var listName = [10, 20, 30, 40];

//   listName.add(50);

//   var names = [];
//   names.add('shekhar');
//   names.add('parveen');
//   names.add('kuldeep');
//   names.add('');

//   names.insert(2, 26);
//   names.addAll(listName);

//   print('$names');
// }
import 'dart:io';

void main() {
  stdout.write('enter first no.:');
  double num1 = double.parse(stdin.readLineSync() ?? '');

  stdout.write('enter second no.:');
  double num2 = double.parse(stdin.readLineSync() ?? '');

  if (num1 == Null || num2 == Null) {
    print('Enter a valid no.');
    return;
  }
  stdout.write('Enter an operation (+, -, *, /): ');
  String? operation = stdin.readLineSync();

  switch (operation) {
    case '+':
      print('result: ${num1 + num2}');
      return;
    case '-':
      print('result: ${num1 - num2}');
      return;
    case '*':
      print('result ${num1 * num2}');
      return;
    case '/':
      if (num2 == 0) {
        print('error : a no divided by 0 is 0');
      } else {
        print('result: ${num1 / num2}');
      }
      return;
    default:
      print('invalid operation : please use +,-,*,/');
  }
}
