class Area {
  double? length;
  double? breadth;

  double calculateArea() {
    return length! * breadth!;
  }
}

void main() {
  var area = Area();
  area.length = 10.0;
  area.breadth = 5.0;

  print("Luas area: ${area.calculateArea()}");
}