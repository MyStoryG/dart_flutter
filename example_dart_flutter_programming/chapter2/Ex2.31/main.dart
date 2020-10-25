main() {
  var person = Person();
  var init = Person.init();
}

class Person {
  Person() {
    print('This is Person Constructor!');
  }

  Person.init() {
    print('This is Person.init Constructor!');
  }
}

class Student extends Person {
  Student() {
    print('This is Student Constructor!');
  }
}
