main() {
  var numbers = {};
  for (int i = 0; i < 5; i++) {
    numbers[i] = i;
    print('[for] numbers[$i] = ${numbers[i]}');
  }


  int i = 0;
  while (i < 5) {
    print('[while] numbers[$i] = ${numbers[i]}');
    i++;
  }

  i = 0;
  do {
    print('[do-while] numbers[$i] = ${numbers[i]}');
    i++;
  } while (i < 5);
}
