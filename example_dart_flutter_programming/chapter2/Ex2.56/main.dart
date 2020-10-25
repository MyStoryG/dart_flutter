import 'dart:isolate';

void main() {
//  ReceivePort mainReceivePort = new ReceivePort(); ①
  Isolate.spawn(isolateTest, 1);
  Isolate.spawn(isolateTest, 2);
  Isolate.spawn(isolateTest, 3);
}

isolateTest(var m) {
  print('isolate no.$m');
}
