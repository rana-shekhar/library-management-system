void main() {
  List<String> names = ['shekhar', 'vishal', 'kapis', 'sandeep'];
  String longestName = names[0];

  for (int i = 1; i < names.length; i++) {
    if (names[i].length > longestName.length) {
      longestName = names[i];
    }
  }

  print('Longest name: $longestName');
}
