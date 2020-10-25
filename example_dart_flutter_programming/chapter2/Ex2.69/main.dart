import 'dart:async';

main() {
  print('start');

  var stream = getData();
  stream.listen((x) => print(x));

  print('do something');
}

Stream<int> getData() async* {
  for (int i = 0; i < 5; i++) {
    yield i;
  }
}
