main() {
  print('start');
  var stream = Stream.periodic(Duration(seconds: 1), (x) => x).take(5);
  stream.listen(print);
  print('do something');
}
