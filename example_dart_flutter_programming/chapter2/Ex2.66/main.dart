import 'dart:async';

main() {
  print('start');

  StreamController streamCtrl = StreamController();
  streamCtrl.stream.listen((x) => print(x));

  streamCtrl.add(100);
  streamCtrl.add('test');
  streamCtrl.add(200);
  streamCtrl.add(300);
  streamCtrl.close();

  print('do something');
}
