main() {
  var employee;
  print('employee.name = ${(employee == null) ? null : employee.name}');
  print('employee.name = ${employee?.name}');

  employee = Employee();
  print('employee.name = ${(employee == null) ? null : employee.name}');
  print('employee.name = ${employee?.name}');

  print('employee.name = ${employee.name ?? 'assign employee name'}');

  employee.name = null;
  print('employee.name = ${employee.name ?? 'assign employee name'}');
}

class Employee {
  String? name = 'employee';
}
