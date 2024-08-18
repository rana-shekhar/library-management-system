// // void main() {
// //   double principal = 1000;
// //   double rate = 5;
// //   double time = 2;
// //   double simpleInterest = (principal * rate * time) / 100;

// //   print('Simple Interest is: $simpleInterest');
// // }

// import 'dart:io';

// void main() {
//   print('Enter the upper limit for FizzBuzz:');
//   int? upperLimit = int.tryParse(stdin.readLineSync()!);

//   if (upperLimit != null && upperLimit > 0) {
//     for (int i = 1; i <= upperLimit; i++) {
//       if (i % 3 == 0 && i % 5 == 0) {
//         print('FizzBuzz');
//       } else if (i % 3 == 0) {
//         print('Fizz');
//       } else if (i % 5 == 0) {
//         print('Buzz');
//       } else {
//         print(i);
//       }
//     }
//   } else {
//     print('Invalid input. Please enter a positive integer.');
//   }
// }

import 'dart:io';

void main() {
  print('Enter the upper limit for FizzBuzz:');
  int? upperLimit = int.tryParse(stdin.readLineSync()!);

  if (upperLimit != null && upperLimit > 0) {
    for (int i = 1; i <= upperLimit; i++) {
      String result = '';

      if (i % 3 == 0) {
        result += 'Fizz';
      }
      if (i % 5 == 0) {
        result += 'Buzz';
      }

      
      
      print(result);
    }
  } else {
    print('Invalid input. Please enter a positive integer.');
  }
}