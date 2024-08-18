void main() {
  int data = 7;
  List value = [];

  for (int i = 1; i <= 7; i++) {
    if (data % i == 0) {
      value.add(i);
    }
  }

  if (value.length <= 2) {
    print("it is prime number");
  } else {
    print("it is not a prime number");
  }
  print(value);
}
