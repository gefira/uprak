import 'dart:io';
 
class Barang {
  final String nama;
  final int harga;
  int _stok;
 
  Barang(this.nama, this.harga, this._stok);
 
  int get stok => _stok;
 
  bool kurangiStok(int jumlah) {
    if (jumlah <= 0 || jumlah > _stok) return false;
    _stok -= jumlah;
    return true;
  }
}
 
class ItemTransaksi {
  final Barang barang;
  final int jumlah;
 
  ItemTransaksi(this.barang, this.jumlah);
 
  int get subtotal => barang.harga * jumlah;
}
 
class Transaksi {
  final List<ItemTransaksi> _items = [];
 
  void tambahItem(Barang barang, int jumlah) {
    _items.add(ItemTransaksi(barang, jumlah));
  }
 
  int get totalBayar => _items.fold(0, (total, item) => total + item.subtotal);
 
  void cetakRekapan() {
    print('\n=== Rekapan Belanja ===');
    Map<String, ItemTransaksi> gabungan = {};
    for (var item in _items) {
      if (gabungan.containsKey(item.barang.nama)) {
        var lama = gabungan[item.barang.nama]!;
        gabungan[item.barang.nama] =
            ItemTransaksi(item.barang, lama.jumlah + item.jumlah);
      } else {
        gabungan[item.barang.nama] = item;
      }
    }
    gabungan.forEach((nama, item) {
      print('- $nama x${item.jumlah} = ${item.subtotal}');
    });
    print('Total Bayar: $totalBayar');
  }
}
 
void main() {
  List<Barang> daftarBarang = [
    Barang('Susu UHT', 10000, 10),
    Barang('Roti Tawar', 15000, 5),
    Barang('Air Mineral', 5000, 20),
  ];
 
  Transaksi transaksi = Transaksi();
 
  print('=== Toko AMCC ===\n');
 
  bool lanjut = true;
  while (lanjut) {
    print('Barang Tersedia:');
    for (int i = 0; i < daftarBarang.length; i++) {
      Barang b = daftarBarang[i];
      print('${i + 1}. ${b.nama} - Harga: ${b.harga}, Stok: ${b.stok}');
    }
 
    print('');
    stdout.write('Pilih nomor barang yang ingin dibeli: ');
    int? nomor = int.tryParse(stdin.readLineSync() ?? '');
 
    if (nomor == null || nomor < 1 || nomor > daftarBarang.length) {
      print('Nomor barang tidak valid.\n');
      continue;
    }
 
    Barang barangDipilih = daftarBarang[nomor - 1];
 
    stdout.write('Jumlah beli: ');
    int? jumlah = int.tryParse(stdin.readLineSync() ?? '');
 
    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid.\n');
      continue;
    }
 
    if (!barangDipilih.kurangiStok(jumlah)) {
      print('Stok tidak mencukupi! Sisa stok: ${barangDipilih.stok}\n');
      continue;
    }
 
    transaksi.tambahItem(barangDipilih, jumlah);
 
    stdout.write('Apakah ingin membeli lagi? (y/n): ');
    String? jawaban = stdin.readLineSync();
    if (jawaban == null || jawaban.toLowerCase() != 'y') {
      lanjut = false;
    }
    print('');
  }
 
  transaksi.cetakRekapan();
 
  print('\nStok tersisa:');
  for (var b in daftarBarang) {
    print('- ${b.nama}: ${b.stok}');
  }
}
 