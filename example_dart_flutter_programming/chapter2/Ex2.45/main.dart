main() {
  Person person = Developer();
//  Person person = Person(); error
  person.eat();
}

abstract class Person {
  eat();

  sleep() {
    print('Person must sleep');
  }
}

class Developer implements Person {
  @override
  eat() {
    print('Developer eat a meal');
  }

  sleep() {
    print('Developer must sleep');
  }
}
