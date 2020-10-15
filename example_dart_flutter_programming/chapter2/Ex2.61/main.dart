main() {
  print('start');

  var myFuture = getData();
  print('result : $myFuture');

  print('do something');
}

Future<String> getData() {
  var test = Future(() {
    for (int i = 0; i < 10000000000; i++) {
      // Ten billion times. My PC takes about four seconds.
    }
    return 'I got a lot of data! There are 10000000000.';
  });
  return test;
}
