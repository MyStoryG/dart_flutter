main() {
  var person = Person.initName('Kim');
}

class Person {
  String name;
  int age;

  Person(this.name, this.age) {
    print('This is Person($name, $age) Constructor!');
  }

  Person.initName(String name) : this(name, 20);
}
