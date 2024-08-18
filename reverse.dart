// void main() {
//   List<int> numbers = [1, 2, 3, 4, 5];
//   int sum = 0;

//   for (int i = 0; i < numbers.length; i++) {
//     sum = sum + numbers[i];
//   }

//   double average = sum / numbers.length;

//   print('Average of the list: $average');
// }

// void main() {
//   List<int> list1 = [1, 2, 3, 4, 5];
//   List<int> list2 = [3, 4, 5, 6, 7];
//   List<int> commonElements = [];

//   for (int i = 0; i < list1.length; i++) {
//     for (int j = 0; j < list2.length; j++) {
//       if (list1[i] == list2[j]) {
//         commonElements.add(list2[j]);

//       }
//     }
//   }

//   print('Common elements: $commonElements');
// }

void main() {
  int number = 6543;
  List<int> digits = number.toString().split('').map(int.parse).toList();

  int sum = 0;

  for (int i = 0; i < digits.length; i++) {
    sum = sum + digits[i];
  }
  print('The sum of the digits is: $sum');
}
