import 'dart:io';

import 'package:practice_dec1/practice_dec1.dart' as practice_dec1;

void main() {
  List<String> names = [];
  for (int i = 0; i < 3; i++) {
    print('Type name ${i + 1}: ');
    String name = stdin.readLineSync()!;
    names.add(name);
  }

  List<Person> people = [];
  people.add(Student(names[0]));
  people.add(Student(names[1]));
  people.add(Teacher(names[2]));

  for (var person in people) {
    if (person is Student) {
      person.study();
    } else if (person is Teacher) {
      person.explain();
    }

    print('Name: ${person.name}');
  }
}

class Vehicle {
  int? maxSpeed;
  int? milAge;
  int? seatingCapacity;
  String? color;
  int? cost;
  Vehicle(this.seatingCapacity, this.cost, {this.color = 'White'}); //Task 4
  double calc() {
    return seatingCapacity! * 100.0;
  }
} //Task 1

class Scooter extends Vehicle {
  Scooter(super.seatingCapacity, super.color);
} //Task 2

class Bus extends Vehicle {
  Bus(super.color, super.seatingCapacity) {
    super.seatingCapacity = 50;
  }
} //Task 3

class miniBus extends Vehicle {
  int? seatCount = 20;
  miniBus() : super(seatingCapacity, 0.0 as int?);
  @override
  double calc() {
    double cost = super.calc();

    double totalAmount = cost * 1.1;

    return totalAmount;
  }
} //Task 5

class Person {
  String name;

  Person(this.name);
}

class Student extends Person {
  Student(String name) : super(name);

  void study() {
    print('$name learning');
  }
}

class Teacher extends Person {
  Teacher(String name) : super(name);

  void explain() {
    print('$name Train student');
  }
}
