void main() {
  //teacher information are fixed
  var teacher = Teacher(
    'Mrs. Smith',
    35,
    '456 Oak St',
    'T001',
    ['Math', 'English', 'Bangla', 'ICT'],
  );
  print('\nTeacher Information:');
  teacher.displayTeacherInfo();
}

abstract class Role {
  void displayRole();
}

class TeacherRole implements Role {
  @override
  void displayRole() => print('Role: Teacher');
}

class Person implements Role {
  String name, address;
  int age;
  Role role;
  Person(this.name, this.age, this.address, this.role);
  @override
  void displayRole() => role.displayRole();
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;
  Teacher(
      String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address, TeacherRole());
  void displayTeacherInfo() {
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Teacher ID: $teacherID');
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}
