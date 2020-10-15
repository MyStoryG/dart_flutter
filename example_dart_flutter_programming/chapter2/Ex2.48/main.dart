main() {
  List<dynamic> list = [1, 2.5, 'test'];
  print('index of test = ${list.indexOf('test')}'); // 'test'의 인덱스 값 출력
  list.add('new'); // 'new' 추가
  list.addAll([100, 'korea']); // 여러 요소 추가
  list.remove(2.5); // 요소 중 2.5 삭제
  list.removeAt(0); // 인덱스 0의 요소(=1) 삭제
  print('-----Start of list-----');
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  print('------End of list------');
  print('first of list = ${list.first}');
  print('last of list = ${list.last}');
  print('reverse of list = ${list.reversed}');
  if (list.contains('new')) {
    print('There is new.');
  }
  if (list.isNotEmpty) {
    print('list is not empty');
  }
  list.clear(); // 리스트 모든 항목 삭제
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  if (list.isEmpty) {
    print('list is empty');
  }
  list.add(1000); // 1000 추가
  // 리스트의 요소가 단 1개라면 해당 요소 리턴
  print('list has just one element = ${list.single}');
  list.addAll([100, 20, 1, 200, 5, 3, 30, 2000]);
  list.sort(); // 리스트 정렬
  print(list);
}
