main() {
  var person = Person();
  var kim = Person.init('Kim');
}

class Person {
  String name;
  int age;

  Person() {
    print('This is Person() Constructor!');
  }

  Person.init(String name) {
    print('This is Person($name) Constructor!');
  }
}
