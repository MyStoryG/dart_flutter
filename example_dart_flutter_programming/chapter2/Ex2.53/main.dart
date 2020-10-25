main() {
  Map<int, String> testMap = {1: 'Red', 2: 'Orange', 3: 'Yellow'};
  testMap[4] = 'Green';

  testMap.update(1, (value) => 'NewRed', ifAbsent: () => 'NewColor');
  testMap.update(5, (value) => 'NewBlue', ifAbsent: () => 'NewColor');

  print(testMap[1]);
  print(testMap[5]);

  print(testMap);
}
