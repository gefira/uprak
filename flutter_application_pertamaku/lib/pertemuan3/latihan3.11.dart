class Kendaraan {
  String merk;
  int tahun;

  // Constructor
  Kendaraan(this.merk, this.tahun);

  void info() {
    print("Kendaraan: $merk, Tahun: $tahun");
  }
}

void main() {
  var mobil = Kendaraan("Toyota", 2022);
  mobil.info(); // Output: Kendaraan: Toyota, Tahun: 2022
}