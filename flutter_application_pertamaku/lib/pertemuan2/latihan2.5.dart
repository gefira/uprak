import 'dart:io';

main(){
  stdout.write("Nilai a : ");
  var input_a = stdin.readLineSync();

  var angka_a = double.parse(input_a!);

  stdout.write("Nilai b : ");
  var input_b = stdin.readLineSync();

  var angka_b = double.parse(input_b!);

  double hasil;

  hasil = angka_a + angka_b;

  print("Hasil Penjumlahan :. $hasil");
}