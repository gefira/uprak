class Mobil {
  String merk;
  String warna;
  int kecepatan;

  Mobil(this.merk, this.warna, this.kecepatan);

  void jalan() {
    print("$merk sedang berjalan dengan kecepatan $kecepatan km/jam.");
  }

  void rem() {
    print("$merk berhenti.");
  }

  void klakson() {
    print("$merk membunyikan klakson: Beep Beep!");
  }
}

void main() {
  var avanza = Mobil("Toyota Avanza", "Hitam", 80);
  avanza.jalan();   // Toyota Avanza sedang berjalan dengan kecepatan 80 km/jam.
  avanza.klakson(); // Toyota Avanza membunyikan klakson: Beep Beep!
  avanza.rem();     // Toyota Avanza berhenti.

  var civic = Mobil("Honda Civic", "Merah", 120);
  civic.jalan();    // Honda Civic sedang berjalan dengan kecepatan 120 km/jam.
}