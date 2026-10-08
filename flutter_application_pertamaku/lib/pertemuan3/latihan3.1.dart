// Membuat class Kendaraan
class Kendaraan {
  String merk = "";
  int tahun = 0;

  void jalan() {
    print("$merk sedang berjalan.");
  }
}

void main() {
  // Membuat object dari class Kendaraan
  var mobil = Kendaraan();
  mobil.merk = "Toyota";
  mobil.tahun = 2022;

  mobil.jalan(); // Output: Toyota sedang berjalan.
}