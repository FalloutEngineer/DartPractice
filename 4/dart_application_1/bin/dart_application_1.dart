import 'dart:developer';

void main(List<String> arguments) {
  Dog dog1 = Dog('rex', 5);
  Dog dog2 = Dog.fromString('rex 10');
  Dog dog3 = Dog.fromWeirdString('20 rex');

  print("${dog1.age}, ${dog2.age}, ${dog3.age}");
}

class Dog {
  String name;
  int age;

  factory Dog.fromString(String data) {
    var splitted = data.split(' ');
    var name = splitted[0];
    var age = int.parse(splitted[1]);
    return Dog(name, age);
  }

  factory Dog.fromWeirdString(String data) {
    var splitted = data.split(' ');
    var name = splitted[1];
    var age = int.parse(splitted[0]);
    return Dog(name, age);
  }

  Dog(this.name, this.age);
}
