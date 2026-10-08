// Abstract class
abstract class Hewan {
  String nama;

  Hewan(this.nama);

  void bersuara(); // Method abstrak (harus diimplementasikan)
}

class Kucing extends Hewan {
  Kucing(String nama) : super(nama);

  @override
  void bersuara() {
    print("$nama: Meong!");
  }
}

class Anjing extends Hewan {
  Anjing(String nama) : super(nama);

  @override
  void bersuara() {
    print("$nama: Guk guk!");
  }
}

void main() {
  Kucing kucing1 = Kucing("Kitty");
  Anjing anjing1 = Anjing("Buddy");

  anjing1.bersuara(); // Output: Buddy: Guk guk!
  kucing1.bersuara(); // Output: Kitty: Meong!
}