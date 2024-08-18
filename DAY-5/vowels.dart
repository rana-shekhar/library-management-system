// void main(){
// String name = 'Shekhar'.toLowerCase();

// int vowelsCount = 0;
// for (int i = 0; i < name.length;i++)
// {
//     if (name[i] == 'a' || name[i] == 'e' || name[i] == 'i' ||
//     name[i] == 'o' || name[i] == 'u' ){
//         vowelsCount++;
//     }
// }
// print('$vowelsCount');
// }

import 'dart:io';
void main (){
print('enter a word: ');
String input = stdin.readLineSync()!.toLowerCase();
int vowelsCount = 0;
 String vowel = 'aeiou';

for(int i = 0; i < input.length;i++){
    if(vowel.contains(input[i])){
        vowelsCount++;
    }
}
print('$vowelsCount');
}
