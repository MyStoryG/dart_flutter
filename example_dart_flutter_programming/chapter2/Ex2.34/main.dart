main() {
  var kim = Person.init('Kim');
}

class Person {
  String name;
  int age;

  Person.init(String name) {
    print('This is Person($name) Constructor!');
  }
}
