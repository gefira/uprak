import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo Animasi Transisi',
    home: HalamanUtamaAnimasi(),
  ));
}

class HalamanUtamaAnimasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Animasi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Latihan 5.4 - Fade Transition
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HalamanBaru(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              child: Text('Buka Fade Transition (Latihan 5.4)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Latihan 5.5 - Scale Transition
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HalamanBaru(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text('Buka Scale Transition (Latihan 5.5)'),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman tujuan transisi
class HalamanBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Baru')),
      body: Center(
        child: Text(
          'Berhasil pindah dengan animasi!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}