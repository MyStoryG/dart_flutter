import 'package:dartEx01/dartEx01.dart' as dartEx01;

// Define a function.
set(int a, int b) {
  return a + b;
}

main() {
  var numberA = 10;
  var numberB = 25;
  var result = set(numberA, numberB);
  dartEx01.printResult(result);
}
