main() {
  // 한 줄만 주석

  /*
  여러 줄 주석
  var numberA = 1;
  var numberB = 2;
   */

  var numberA = 10;
  var numberB = 20;
  var result = add(numberA, numberB);
  print('The number is $result.');
}

add(int a, int b) {
  return a + b;
}
