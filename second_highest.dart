void main() {
  List<int> list = [50, 10, 15, 60, 25, 30, 40];
  int largest = list[0];
  int slargest = list[0];

  for (int i = 1; i < list.length; i++) {
    if (list[i] > largest) {
      largest = list[i];
    } else if (list[i] > slargest && list[i] != largest) {
      slargest = list[i];
    }
  }
  print(slargest);
}
