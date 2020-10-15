main() {
  print('${getAddress('서울')}');
  print('${getAddress('서울', '서초')}');
}

String getAddress(String city, [String district = '강남', String zipCode = '111222']) {
  return '$city시 $district구 $zipCode';
}
