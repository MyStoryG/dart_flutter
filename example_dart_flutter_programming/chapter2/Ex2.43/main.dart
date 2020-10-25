class Person {
  String _name;

  String get name => _name;
  set setName(String name) => _name = name;
}

main() {
  Person person = Person();
  person.setName = 'Kim';
  print(person.name);
}
