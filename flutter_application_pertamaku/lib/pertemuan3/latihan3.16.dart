// Class induk
class Kendaraan {
  String merk;

  Kendaraan(this.merk);

  void jalan() {
    print("$merk sedang berjalan...");
  }
}

class Motor extends Kendaraan {
  int cc; // Motor punya tambahan atribut: kapasitas mesin (cc)

  Motor(
    super.merk,
    this.cc,
  ); // Memanggil constructor Kendaraan dan menambah atribut cc

  void infoMotor() {
    print("Motor $merk dengan mesin $cc cc.");
  }
}

void main() {
  Motor motor1 = Motor("Honda", 150);
  motor1.jalan();
  motor1.infoMotor();
}