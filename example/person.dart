library example;

import 'package:annotations/annotation.dart';

class Person extends Object with Validatable {


  @required(message:"Please provide a name.")
  String name;

  @required()
  @range(min:13, max:99)
  int age;

  Person(this.name, this.age);
}

void main() {

  Person jamie = new Person("Jamie", 23);
  print(jamie.isValid()); // -> true

  Person anna = new Person("Anna", 9);
  print(anna.isValid()); // -> false - because age is not in range

  Person ghost = new Person('', 99);
  print(ghost.isValid()); // -> false - because name is required

  ghost.name = null;
  print(ghost.isValid()); // -> false - because name is required

  ghost.name = "Casper";
  print(ghost.isValid()); // -> true

  print(ghost.invalidProperties.length);
  ghost.invalidProperties.forEach((invalid) {
    print(invalid.message);
  });



}