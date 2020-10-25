main() {
  Set<dynamic> testSet = {1, 2.5, 'test'};
  testSet.add(1);
  testSet.add(1);
  testSet.add(1);
  testSet.add(3);
  testSet.add(2);
  testSet.add('korea');
  testSet.add('korea');
  testSet.add('korea');


  print('-----Start of testSet-----');
  for(dynamic each in testSet) {
  print(each);
  }
  print('------End of testSet------');
}
