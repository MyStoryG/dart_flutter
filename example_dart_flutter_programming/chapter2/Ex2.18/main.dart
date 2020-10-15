main() {
  int a = 11;
  int b = 5;

  print('$a / $b = ${divide(a, b)}');
  print('$a ~/ $b = ${divideQuotient(a, b)}');
  print('$a % $b = ${divideModulo(a, b)}');
}

double divide(_a, _b) {
  return _a / _b;
}

int divideQuotient(_a, _b) {
  return _a ~/ _b;
}

int divideModulo(_a, _b) {
  return _a % _b;
}
