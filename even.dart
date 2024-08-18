void main() {
  List<int> originalList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> evenNumbers = [];

  for (int i = 0; i < originalList.length; i++) {
    int number = originalList[i];
    if (number % 2 == 0) {
      evenNumbers.add(number);
    }
  }

  print(evenNumbers);
}
