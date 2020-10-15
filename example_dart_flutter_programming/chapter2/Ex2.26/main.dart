main() {
  var student = new Person();
  var teacher = Person();
  student.name = 'Kim';
  teacher.name = 'Park';
  print('student name = ${student.getName()}');
  print('student name = ${teacher.getName()}');
}

class Person {
  String name;
  int age;

  getName() {
    return name;
  }
}
