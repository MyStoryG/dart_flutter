main() {
  Student student = Student();
  student.studentID = 2020;
  student.setName('Kim');
  student.showInfo();
}

class Person {
  String name;

  setName(String name) {
    this.name = name;
  }

  getName() {
    return name;
  }

  showInfo() {
    print('name is $name');
  }
}

class Student extends Person {
  int studentID;

  @override
  showInfo() {
    print('name is ${super.getName()} and ID is $studentID.');
//    print('name is $name and ID is $studentID.');
  }
}
