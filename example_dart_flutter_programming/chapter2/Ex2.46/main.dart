main() {
//  Person person = Developer();
  Developer person = Developer();
  person.eat();
  person.sleep();
  person.work();
}

abstract class Person {
  eat();

  sleep() {
    print('Person must sleep');
  }
}

abstract class Junior {
  work() {
    print('work hard');
  }
}

class Developer implements Person, Junior {
  @override
  eat() {
    print('Developer eat a meal');
  }

  sleep() {
    print('Developer must sleep');
  }

  work() {
    print('Junior developer works hard');
  }
}
