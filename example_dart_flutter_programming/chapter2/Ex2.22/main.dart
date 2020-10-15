main() {
  Employee employee = Employee();
  Student student = Student();

  Person person1 = employee as Person;
  Person person2 = student as Person;
//  Person person = employee; as Person 생략 가능

  print('person1.name = ${person1.name}');
  print('person2.name = ${person2.name}');

  print('(employee as Person).name = ${(employee as Person).name}');
//  print('(employee as Person).name = ${(employee as Student).name}'); // error

  if (employee is Employee) {
    print('employee is Employee');
  } else {
    print('employee is not Employee');
  }

  if (employee is Student) {
    print('employee is Student');
  } else {
    print('employee is not Student');
  }
}

class Person {
  var name = 'person';
}

class Employee extends Person {
  var name = 'employee';
}

class Student extends Person {
  var name = 'student';
}
