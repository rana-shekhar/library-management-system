/*void main() {
  var number = [34, 67, 56, 21, 78, 98, 43, 45, 234];

  var highestNumber = number[0];

  for (var i = 1; i < number.length; i++) {
    if (number[i] > highestNumber) {
      highestNumber = number[i];
    }
  }
  print(highestNumber);
}*/
void main() {
  var listOne = [2, 4, 6, 5, 3, 1, 7, 8, 9, 6];
  var highestNumber = [];

  for (var i = 1; i < listOne.length; i++) {
    if (listOne[i] > highestNumber) {
      highestNumber = listOne[i];
    }
  }
  print(highestNumber);
}
