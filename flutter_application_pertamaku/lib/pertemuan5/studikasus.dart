import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Screen1(),
  ));
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> { //menyimpan data dan perubahan yang terjadi pada Screen1.
  final ctrl = TextEditingController();
  String unit = 'Celsius';
  final units = ['Celsius', 'Fahrenheit', 'Reamur', 'Kelvin']; //untuk menyimpan satuan suhu yang tersedia

  @override
  Widget build(BuildContext context) { //untuk membangun tampilan
    return Scaffold(
      appBar: AppBar(title: Text('Input Suhu')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nilai Suhu'),
            ),
            DropdownButton<String>( //untuk membuat pilihan satuan suhu
              value: unit,
              isExpanded: true,
              items: units.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
              onChanged: (val) => setState(() => unit = val!),
            ),
            SizedBox(height: 20),
            ElevatedButton( //buat Tombol Konversi
              onPressed: () {
                double? val = double.tryParse(ctrl.text); //untuk mengubah input dari TextField menjadi angka double
                if (val != null) { //cek input
                  Navigator.push( //untuk berpindah dari Screen1 ke Screen2.
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(nilai: val, satuan: unit),
                    ),
                  );
                }
              },
              child: Text('Konversi'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget { //tampilannya tidak perlu berubah setelah dibuka
  final double nilai; //Menyimpan angka suhu
  final String satuan; //Menyimpan satuan

  Screen2({required this.nilai, required this.satuan}); //untuk menerima data dari Screen1

  @override
  Widget build(BuildContext context) {
    // Normalisasi ke Celsius
    double c = 0; //untuk menyimpan nilai suhu dalam Celsius
    if (satuan == 'Celsius') c = nilai;
    else if (satuan == 'Fahrenheit') c = (nilai - 32) * 5 / 9;
    else if (satuan == 'Reamur') c = nilai * 5 / 4;
    else if (satuan == 'Kelvin') c = nilai - 273.15;

    // Hitung 4 satuan
    Map<String, double> hasil = {
      'Celsius': c,
      'Fahrenheit': (c * 9 / 5) + 32,
      'Reamur': c * 4 / 5,
      'Kelvin': c + 273.15,
    };

    // Menghitung semua hasil konversi
    var listLain = hasil.entries.where((e) => e.key != satuan).toList(); //Mengambil 3 satuan lainnya

    return Scaffold(
      appBar: AppBar(title: Text('Hasil Konversi')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Input: $nilai $satuan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: listLain.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(listLain[i].key),
                    trailing: Text(listLain[i].value.toStringAsFixed(2)),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}