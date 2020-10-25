main() {
  Set<dynamic> testSet = {1, 2.5, 'test'};
//  print('index of test = ${testSet.indexOf('test')}'); // error 사용 불가
  testSet.add('new'); // 'new' 추가
  testSet.addAll({100, 'korea'}); // 여러 요소 추가
  testSet.remove(2.5); // 요소 중 2.5 삭제
//  testSet.removeAt(0); // error 사용 불가


  print('-----Start of testSet-----');
  print(testSet);
  print('------End of testSet------');

  print('first of testSet = ${testSet.first}');
  print('last of testSet = ${testSet.last}');
//  print('reverse of testSet = ${testSet.reversed}'); // error 사용 불가

  if (testSet.contains('new')) {
  print('There is new.');
  }

  if (testSet.isNotEmpty) {
  print('testSet is not empty');
  }

  testSet.clear(); // Set 모든 항목 삭제
  print(testSet);

  if (testSet.isEmpty) {
  print('testSet is empty');
  }

  testSet.add(1000); // 1000 추가

  // Set의 요소가 단 1개라면 해당 요소 리턴
  print('testSet has just one element = ${testSet.single}');

  testSet.addAll([100, 20, 1, 200, 5, 3, 30, 2000]);
//  testSet.sort(); // error 사용 불가
  print(testSet);
}
