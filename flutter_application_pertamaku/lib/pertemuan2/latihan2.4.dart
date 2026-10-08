import 'dart:io';

main() {
  stdout.write("Siapa kamu: ");
  var nama = stdin.readLineSync();
  print("Hello $nama!");

  stdout.write("Masukan angka: ");
  var input = stdin.readLineSync();

  int angka = int.parse(input!);

  print("Angka yang kamu masukkan: $angka");
}