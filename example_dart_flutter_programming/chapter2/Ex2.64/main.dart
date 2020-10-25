main() {
  print('start');
  var stream = Stream.value(100).listen((dynamic x) => print('getData : $x'));
  print('do something');
}
