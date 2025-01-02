import 'dart:io';
void main() {
  print(
      "Student information collection for user. Subject score number in(1-100);");
  Student newStudent = getStudentInput();
  print("\nStudent Information:");
  newStudent.Info();
}
class Person {
  final String name;
  final int age;
  final String address;
  Person({required this.name, required this.age, required this.address});
  void Info() {
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
  }
  void Rule() {
    print("Role: Person");
  }
}
class Student extends Person {
  final String studentID;
  final List<double> courseScores;
  Student({
    required super.name,
    required super.age,
    required super.address,
    required this.studentID,
    required this.courseScores,
  });
  @override
  void Rule() {
    print("Rule: Student");
  }
  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0;
    }
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
  String getGrade(double average) {
    if (average >= 80) {
      return "A+";
    } else if (average >= 70) {
      return "A";
    } else if (average >= 60) {
      return "A-";
    } else if (average >= 50) {
      return "B";
    } else if (average >= 40) {
      return "C";
    } else if (average >= 33) {
      return "D";
    } else {
      return "F";
    }
  }
  @override
  void Info() {
    super.Info();
    Rule();
    print("Student ID: $studentID");
    print("Average Score: ${calculateAverageScore()}");
    print("Grade: ${getGrade(calculateAverageScore())}");
  }
}
Student getStudentInput() {
  stdout.write("Enter student name: ");
  String name = stdin.readLineSync()!.trim();
  stdout.write("Enter student age: ");
  int age = int.parse(stdin.readLineSync()!.trim());
  stdout.write("Enter student address: ");
  String address = stdin.readLineSync()!.trim();
  stdout.write("Enter student ID: ");
  String studentID = stdin.readLineSync()!.trim();
  List<double> scores = [];
  for (int i = 0; i < 5; i++) {
    while (true) {
      stdout.write("Enter Subject ${i + 1} score: ");
      String input = stdin.readLineSync()!.trim();
      try {
        double score = double.parse(input);
        scores.add(score);
        break;
      } catch (e) {
        print("Invalid input. Please enter a valid number.");
      }
    }
  }
  return Student(
      name: name,
      age: age,
      address: address,
      studentID: studentID,
      courseScores: scores);
}
