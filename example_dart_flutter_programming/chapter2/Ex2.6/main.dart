import 'package:dartEx01/dartEx01.dart' as dartEx01;

// Define a function.
yield(int a, int b) {
  return a + b;
}

main() {
  var await = 10;
  var numberB = 25;
  var result = yield(await, numberB);
  dartEx01.printResult(result);
}
