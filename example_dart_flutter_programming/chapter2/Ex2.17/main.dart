main() {
  int a = 10;
  int b = 5;

  print('$a + $b = ${add(a, b)}');
  print('$a * $b = ${multi(a, b)}');
  print('$a - $b = ${sub(a, b)}');
}

int add(int a, int b) {
  return a + b;
}

// anonymous function
var multi = (_a, _b) {
  return _a * _b;
};

//lambda
//int sub(int _a, int _b) => _a - _b;
sub(_a, _b) => _a - _b;
