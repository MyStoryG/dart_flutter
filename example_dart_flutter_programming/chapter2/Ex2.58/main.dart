main() {
  print('start');

  Future<String> myFuture = new Future(() {
    for (int i = 0; i < 10000000000; i++) {
      // Ten billion times. My PC takes about four seconds.
    }
    return 'I got lots of data! There are 10000000000.';
  });

  myFuture.then((data) {
    print(data);
  }, onError: (e) {
    print(e);
  });

  print('do something');
}
