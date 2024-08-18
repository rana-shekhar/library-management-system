import 'dart:io';

void main() {
  /* write a program to calculate electricity billsper unit cost varies from 20-40
 if consumed unit is kess then 100 then per unit cost is 20
 if consumed unit is greater then 100 but less then 200 then per unit cost is 30
 if consumed unit is more then 300 then per unit cost is 40 */

  stdout.write('Enter consumed unit');
  int consumedUnit = int.parse(stdin.readLineSync()!);
  int finalPrice = 0;

  if (consumedUnit < 100) {
    finalPrice = consumedUnit * 20;
    print('your elecricity bill is: $finalPrice');
    print('consumed unit is: $consumedUnit');
  } else if (consumedUnit > 100 && consumedUnit < 200) {
    finalPrice = consumedUnit * 30;
    print('your elecricity bill is: $finalPrice');
    print('consumed unit is: $consumedUnit');
  }
  if (consumedUnit > 300) {
    finalPrice = consumedUnit * 40;
    print('your elecricity bill is: $finalPrice');
    print('consumed unit is: $consumedUnit');
  }
}
