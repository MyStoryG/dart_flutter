main() {
  final int NUMBER = get();
  const int PRICE = get(); // error

  final NAME = 'Kim';
  const COLOR = 'Red';

  print('The NUMBER is $NUMBER.');
  print('The PRICE is $PRICE.');

  print('The NAME is $NAME.');
  print('The COLOR is $COLOR.');
}

get() {
  return 100;
}
