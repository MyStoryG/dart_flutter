main() {
  var person = Person();
}

class Person {
  String name;

  Person() : name = 'Kim' {
    print('This is Person($name) Constructor!');
  }
}
