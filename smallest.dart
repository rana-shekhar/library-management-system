void main() {
  var number = [34, 67, 56, 21, 78, 98, 43, 45, 234];

  var smallestNumber = number[0];

  for (var i = 0; i < number.length; i++) {
    if (number[i] < smallestNumber) {
      smallestNumber = number[i];
    }
  }
  print(smallestNumber);
}
