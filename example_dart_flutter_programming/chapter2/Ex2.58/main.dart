main() {
  print('start');

  Future<String> myFuture = new Future(() {
    for (int i = 0; i < 10000000000; i++) {
      // Ten billion times. My PC takes about four seconds.
    }
    return throw Exception('Failed : data is too many');
  });

  myFuture.then((data) {
    print(data);
  }, onError: (e) {
    print(e);
  });

  print('do something');
}
