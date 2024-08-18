void main() {
  String input = "the quick brown fox jumps over the lazy dog";

  Set<String> st = {};

  for (int i = 0; i < input.length; i++) {
    var char = input[i].toLowerCase();
    st.add(char);
  }

  if (st.length == 27) {
    print("Panagram String");
  } else {
    print(" not a Panagram String");
  }
}
