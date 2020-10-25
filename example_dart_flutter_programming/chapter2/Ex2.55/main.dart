void main() {
  var person = Person();
  print(person.getName<String>('Kim'));
}

class Person {
  T getName<T>(T param) {
    return param;
  }
}
