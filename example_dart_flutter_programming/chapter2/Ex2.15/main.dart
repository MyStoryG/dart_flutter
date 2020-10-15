main() {
  print('${getAddress('서울', district: '강남')}');
  print('${getAddress('서울', district: '강남', zipCode: '012345')}');
//  print('${getAddress(district: '강남', zipCode: '012345')}'); error
}

String getAddress(String city, {String district, String zipCode = '111222'}) {
  return '$city시 $district구 $zipCode';
}
