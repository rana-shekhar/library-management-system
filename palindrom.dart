void main() {
  String word = "radar"; // You can change this word to test with other words
  if (isPalindrome(word)) {
    print('$word is a palindrome.');
  } else {
    print('$word is not a palindrome.');
  }
}

bool isPalindrome(word) {
  String reversedWord = word.split('').reversed.join('');
  return word == reversedWord;
}
