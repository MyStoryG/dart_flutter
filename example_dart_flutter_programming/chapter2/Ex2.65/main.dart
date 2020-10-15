main() {
  print('start');
  var stream = Stream.periodic(Duration(seconds: 1), (x) => x + 1)
      .take(5)
      .listen((x) => print('periodic : $x'));

  Stream.fromIterable(['one', '2.5', 'three', 4, 5])
      .listen((dynamic x) => print('fromIterable : $x'));

  Stream.fromFuture(getData()).listen((x) => print('fromFuture : $x'));
  print('do something');
}

Future<String> getData() async {
  return Future.delayed(Duration(seconds: 3), () => 'after 3 seconds');
}
