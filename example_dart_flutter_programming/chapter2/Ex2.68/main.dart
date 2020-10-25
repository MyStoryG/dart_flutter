import 'dart:async';

main() {
  print('start');

  var stream = Stream.periodic(Duration(seconds: 1), (x) => x + 1).take(3);
  stream.listen(print);
//  stream.listen(print); // error

  StreamController streamCtrl = StreamController.broadcast();
  streamCtrl.stream.listen((x) => print('listen 1 = $x'));
  streamCtrl.stream.listen((x) => print('listen 2 = $x'));

  streamCtrl.add(100);
  streamCtrl.add(200);
  streamCtrl.add(300);
  streamCtrl.close();

  print('do something');
}
