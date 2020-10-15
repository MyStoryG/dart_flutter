import 'dart:async';

main() {
  print('start');

  var stream = requestData();
  stream.listen((String x) => print(x));

  print('do something');
}

Stream<String> requestData() async* {
  for (int i = 1; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 'image0$i';
  }
}
