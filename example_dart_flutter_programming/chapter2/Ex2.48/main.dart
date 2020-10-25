main() {
  List<dynamic> list1 = [1, 2.5, 'test'];
  dynamic list2 = [1, 2.5, 'test'];
  list2 = 1;
  var list3 = [1, 2.5, 'test'];
  // list3 = 1;

  for (int i = 0; i < list1.length; i++) {
    print(list1[i]);
  }
}
