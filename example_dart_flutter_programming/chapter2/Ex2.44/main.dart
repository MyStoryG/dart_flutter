main() {
  Person person = Person();
  print(person.name);
  person.name = null;
  print(person.name);
}

class Person {
  String _name;

  String get name => (_name == null) ? 'Lee' : _name;

  set name(String name) => (name == null) ? _name = 'Park' : _name = name;
}
