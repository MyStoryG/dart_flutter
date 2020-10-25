main() {
  Person person1 = const Person('Kim', 20);
  Person person2 = const Person('Kim', 20);
  Person person3 = new Person('Kim', 20);
  Person person4 = new Person('Kim', 20);

  print(identical(person1, person2));
  print(identical(person2, person3));
  print(identical(person3, person4));
}

class Person {
  final String name;
  final num age;

  const Person(this.name, this.age);
}
