main() {
  Person person = Person();
  person.name = 'Hong';
  print('person name = ${person.getName()}');
}

class Person {
  String name;
  int age;

  getName() {
    return name;
  }
}
