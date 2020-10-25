main() {
  print('start');

  var myFuture = getData();
  myFuture.then((data) => test(data))
      .catchError((e) => print(e));

  var myFuture2 = getData();
  myFuture2.then((data) {
    test(data);
  }, onError: (e) {
    print(e);
  });

  print('do something');
}

Future<String> getData() {
  return Future(() {
    return 'I got a lot of data! There are 10000000000.';
  });
}

test(String data) {
  print(data);
  return throw Exception('Failed : test is empty');
}
