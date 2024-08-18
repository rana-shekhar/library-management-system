// void main() {
//   int factorial(int number) {
//     int fact = 1;
//     for (int i = 2; i <= number; i++) {
//       fact *= i;
//     }
    
//   }

//   // Example usage of factorial function
//   int num = 5;
//   int fact = factorial(num);
//   print('Factorial of $num is $fact');
// }
import 'dart:io';
void main(){
  print('enter a number :');
    int input = int.parse(stdin.readLineSync()!);
  
  int fact = 1;
  for(int i = 1; i<=input;i++){
    fact = fact*i;
  }
  print('factorial of your no. is : $fact');
}


// import 'dart:io';

// void main() {
//   print('Enter a number:');
//   int number = int.parse(stdin.readLineSync()!); // Reading input from the user and converting it to an integer
  
//   int factorial = 1;

//   for (int i = 1; i <= number; i++) {
//     factorial *= i; // Multiply factorial by the current number
//   }

//   print('Factorial of $number is $factorial');
// }