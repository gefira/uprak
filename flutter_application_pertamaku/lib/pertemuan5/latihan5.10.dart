import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Screen0()));
}

class Screen0 extends StatefulWidget {
  const Screen0({super.key});

  @override
  State<Screen0> createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  String statusBalikan = 'Belum ada status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text('Screen 0')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nama: Gefira, Umur: 20', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen1(nama: 'Budi', umur: '21'),
                  ),
                );
                if (result != null) {
                  setState(() {
                    statusBalikan = result.toString();
                  });
                }
              },
              child: const Text('Kirim Data ke Screen 1'),
            ),
            const SizedBox(height: 24),
            Text(
              'Status balikan dari Screen 1: $statusBalikan',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  final String nama;
  final String umur;
  const Screen1({super.key, required this.nama, required this.umur});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text('Screen 1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Data dari Screen 0:\nNama: ${widget.nama}, Umur: ${widget.umur}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: statusController,
              decoration: const InputDecoration(
                labelText: 'Masukkan status balikan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final status = statusController.text.isEmpty
                    ? 'Tanpa status'
                    : statusController.text;
                Navigator.pop(context, status);
              },
              child: const Text('Kembalikan Data ke Screen 0'),
            ),
          ],
        ),
      ),
    );
  }
}