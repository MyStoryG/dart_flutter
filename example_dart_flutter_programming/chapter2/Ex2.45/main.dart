main() {
  Person person = Developer();
  person.eat();
}

abstract class Person {
  eat();
}

class Developer implements Person {
  @override
  eat() {
    print('Developer eat a meal');
  }
}
