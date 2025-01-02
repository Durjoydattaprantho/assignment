void main() {
  //student information submit
  Student student = Student("Durjoy datta", 23, "Feni", [90, 76, 82]);
  student.displayStudentInfo();
  //teacher information submit
  Teacher teacher =  Teacher("Mrs. Smith", 35, "456 Oak St", ["Math", "English", "Bangla"]);
  teacher.displayTeacherInfo();
}

abstract class Role {
  void displayRole();
}
class Person {
  String name;
  int age;
  String address;
  Person(this.name, this.age, this.address);
}
class Student extends Person implements Role {
  List<int> scores;

  Student(String name, int age, String address, this.scores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (scores.isEmpty) return 0.0;
    int total = scores.reduce((sum, score) => sum + score);
    return total / scores.length;
  }

  void displayStudentInfo() {
    print("Student Information:\n");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    //value change are Average Score value change
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}\n");
  }
}

class Teacher extends Person implements Role {
  List<String> courses;

  Teacher(String name, int age, String address, this.courses)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayTeacherInfo() {
    print("Teacher Information:\n");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (String course in courses) {
      print("- $course");
    }
  }
}
