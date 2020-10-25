main() {
  print('start');

  var myFuture = getData();
  myFuture.then((data) => print(data))
      .catchError((e) => print(e));

  print('do something');
}

Future<String> getData() {
  return Future(() {
    for (int i = 0; i < 10000000000; i++) {
      // Ten billion times. My PC takes about four seconds.
    }
    return 'I got a lot of data! There are 10000000000.';
//    return throw Exception('Failed : data is too much');
  });
}
