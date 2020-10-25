void main() {
  var manager1 = Manager<Person>();
  manager1.eat();
  var manager2 = Manager<Student>();
  manager2.eat();
  var manager3 = Manager();
  manager3.eat();
  //var manager4 = Manager<Dog>(); // error
}

class Person {
  eat() {
    print('Person eats a food');
  }
}

class Student extends Person {
  eat() {
    print('Student eats a hambuger');
  }
}

class Manager<T extends Person> {
  eat() {
    print('Manager eats a sandwich');
  }
}

class Dog {
  eat() {
    print('Dog eats a dog food');
  }
}
