import 'package:dartEx01/dartEx01.dart' as set;

// Define a function.
add(int a, int b) {
  return a + b;
}

main() {
  var numberA = 10;
  var numberB = 25;
  var result = add(numberA, numberB);
  set.printResult(result);
}