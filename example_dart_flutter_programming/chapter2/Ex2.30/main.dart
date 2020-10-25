main() {
  var student = Student();
}

class Person {
  String name;

  Person() {
    print('This is Person Constructor!');
  }
}

class Student extends Person {
  Student() {
    print('This is Student Constructor!');
  }
}
