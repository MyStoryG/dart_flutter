main() {
  int a = 10;
  int b = 20;

  if (a < b) {
    print('$a < $b');
  } else {
    print('$a >= $b');
  }

  assert(a > b);

  var port = [22, 25, 53];
  switch (port[0]) {
    case 22:
      print('SSH : 22');
      break;
    case 25:
      print('SMTP : 25');
      break;
    case 53:
      print('DNS : 53');
      break;
  }
}
