void main() {
  List<int> originalList = [23, 55, 76, 45, 98, 6, 3, 45, 13];
  List<int> reversedList = [];

  for (int i = originalList.length - 1; i >= 0; i--) {
    reversedList.add(originalList[i]);
  }

  print('Original List: $originalList');
  print('Reversed List: $reversedList');
}
