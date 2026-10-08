class Person {
  String? name;
  String? phone;
  bool? isMarried;
  int? age;

  void displayInfo() {
    print("Person name: $name.");
    print("Phone number: $phone.");
    print("Married: $isMarried.");
    print("Age: $age.");
  }
}

// Tambahkan fungsi main() 
void main() {
  var person = Person();
  person.name = "Budi";
  person.phone = "08123456789";
  person.isMarried = false;
  person.age = 20;

  person.displayInfo();
}