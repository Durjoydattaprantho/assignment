void main() {
  Student johnDoe = Student(name: "Durjoy datta", age: 2025, address: "Feni ");

  johnDoe.displayInfo();
}

class Student {
  final String name;
  final int age;
  final String address;

  Student({
    required this.name,
    required this.age,
    required this.address,
  });

  void displayInfo() {
    print("Student Information:");
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
  }
}
