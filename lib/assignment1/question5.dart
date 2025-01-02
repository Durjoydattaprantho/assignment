void main() {
  final student = Student("Durjoy datta", 20, "Feni", [90, 85, 82]);
  final teacher = Teacher("Rafat Meraz", 35, "Dhaka", ["Math", "English", "Bangla"]);
  student.displayRole();
  teacher.displayRole();
}
abstract class Role {
  void displayRole();
}
class Student implements Role {
  final String name;
  final int age;
  final String address;
  final List<int> scores;

  Student(this.name, this.age, this.address, this.scores);
  double AverageScore() => scores.reduce((a, b) => a + b) / scores.length;

  @override
  void displayRole() {
    print("Student Information:");
    print("Role: Student");
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${AverageScore().toStringAsFixed(1)}");
    print('');
  }
}
class Teacher implements Role {
  final String name;
  final int age;
  final String address;
  final List<String> courses;
  Teacher(this.name, this.age, this.address, this.courses);

  @override
  void displayRole() {
    print("Teacher Information:");
    print("Role: Teacher");
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for(final course in courses) {
      print("- $course");
    }
    print('');
  }
}