class Hewan {
  void bersuara() {
    print("Hewan bersuara...");
  }
}

class Burung extends Hewan {
  @override
  void bersuara() {
    print("Burung berkicau...");
  }
}

class Ayam extends Hewan {
  @override
  void bersuara() {
    print("Ayam berkokok...");
  }
}

class Kucing extends Hewan {
  @override
  void bersuara() {
    print("Kucing mengeong...");
  }
}

void main() {
  Hewan burung = Burung();
  Hewan ayam = Ayam();
  Hewan kucing = Kucing();

  kucing.bersuara(); // Output: Kucing mengeong...
  burung.bersuara(); // Output: Burung berkicau...
  ayam.bersuara(); // Output: Ayam berkokok...
}