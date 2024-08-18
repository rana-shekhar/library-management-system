int findLargest(List<int> numbers) {
  if (numbers.isEmpty) {
    throw Exception("The list cannot be empty.");
  }

  int largest = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
  }

  return largest;
}

void main() {
  List<int> list1 = [10, 4, 7, 15, 2, 9];
  print('The largest number in list1 is: ${findLargest(list1)}');

  List<int> list2 = [99, 88, 77, 66, 55];
  print('The largest number in list2 is: ${findLargest(list2)}');

  try {
    List<int> emptyList = [];
    print('The largest number in emptyList is: ${findLargest(emptyList)}');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
