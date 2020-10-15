main() {
  var person = Person();
}

class Person {
  String name;
  int age;

  Person() {
    print('This is Person Constructor!');
  }

  Person(String name) {
    print('This is Person($name) Constructor!');
  }
}
