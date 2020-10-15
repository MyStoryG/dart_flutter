main() {
  int a = 10;
  int b = 5;
  var name = getName();

  print('Name is $name.');
  print('$a + $b = ${add(a, b)}');
  print('$a - $b = ${sub(a, b)}');
}

getName() {
  return 'Kim';
}

int add(int a, int b) {
  return a + b;
}

int sub(a, b) {
  return a - b;
}
