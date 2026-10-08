import 'dart:io';

void main() {
  // membuat list dengan ukuran 5
  var languages = List.filled(5, ""); // list string panjang 5

  print("Sebutkan ${languages.length} bahasa yang ingin kamu pelajari!");

  for (int i = 0; i < languages.length; i++) {
    stdout.write("$i. ");
    languages[i] = stdin.readLineSync() ?? ""; // aman dari null
  }

  print(languages);
}