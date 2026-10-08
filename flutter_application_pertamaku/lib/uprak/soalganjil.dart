import 'package:flutter/material.dart';

void main() {
  runApp(const SmartRetailApp());
}

class SmartRetailApp extends StatelessWidget {
  const SmartRetailApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartRetail POS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==========================================
// 1. Halaman Autentikasi Pengguna
// ==========================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'admin' &&
        _passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau Password salah!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartRetail Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Masukkan Username',
                prefixIcon: const Icon(Icons.person),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Masukkan Password',
                prefixIcon: const Icon(Icons.lock),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. Halaman Utama & Dasbor Kasir
// ==========================================

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _katalogProduk = [
    {
      'nama': 'MacBook Air',
      'harga': 'Rp 25.000.000',
      'gambar': 'Images/MacBook Air.jpg',
    },
    {
      'nama': 'Iphone 17 Pro Max',
      'harga': 'Rp 19.000.000',
      'gambar': 'Images/Iphone 17 Pro Max.jpg',
    },
    {
      'nama': 'Canon Printer',
      'harga': 'Rp 2.500.000',
      'gambar': 'Images/Canon Printer.jpg',
    },
    {
      'nama': 'Logitech Keyboard',
      'harga': 'Rp 450.000',
      'gambar': 'Images/Logitech Keyboard.jpg',
    },
    {
      'nama': 'Logitech Mouse',
      'harga': 'Rp 150.000',
      'gambar': 'Images/Logitech Mouse.jpg',
    },
  ];

  // Menyimpan riwayat transaksi secara dinamis
  final List<Map<String, dynamic>> _riwayatTransaksi = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ==========================================
  // PESAN PRODUK
  // ==========================================

  void _pesanProduk(Map<String, dynamic> produk) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderFormScreen(
          produk: produk,
        ),
      ),
    );

    if (!mounted) return;

    // Jika transaksi berhasil
    if (result != null) {
      setState(() {
        _riwayatTransaksi.add({
          'id':
              'TRX${(_riwayatTransaksi.length + 1).toString().padLeft(3, '0')}',
          'nama': produk['nama'],
          'total': result,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Transaksi untuk ${produk['nama']} sukses!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dasbor Kasir"),
      ),

      // ==========================================
      // DRAWER
      // ==========================================

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Kasir: Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () => Navigator.pop(context),
            ),

            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: _buildBody(),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informasi Toko',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildKatalog();

      case 1:
        return _buildRiwayat();

      case 2:
        return _buildInformasi();

      default:
        return _buildKatalog();
    }
  }

  // ==========================================
  // Sub-menu 1: Katalog
  // ==========================================

  Widget _buildKatalog() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(text: "Produk"),
              Tab(text: "Ketentuan Promo"),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                // ======================================
                // TAB PRODUK
                // ======================================

                ListView.builder(
                  itemCount: _katalogProduk.length,
                  itemBuilder: (context, index) {
                    final produk = _katalogProduk[index];

                    return ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                produk['gambar'],
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                color: Colors.red,
                                padding: const EdgeInsets.all(2),
                                child: const Text(
                                  '50%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      title: Text(produk['nama']),
                      subtitle: Text(produk['harga']),

                      trailing: ElevatedButton(
                        onPressed: () => _pesanProduk(produk),
                        child: const Text('Pesan'),
                      ),
                    );
                  },
                ),

                // ======================================
                // TAB KETENTUAN PROMO
                // ======================================

                SingleChildScrollView(
                  child: Column(
                    children: [

                      // ==================================
                      // PROMO 1
                      // ==================================

                      ExpansionTile(
                        leading: const Icon(
                          Icons.discount,
                          color: Colors.red,
                        ),

                        title: const Text(
                          "Voucher Diskon 50%",
                        ),

                        subtitle: const Text(
                          "Diskon maksimal Rp100.000",
                        ),

                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Syarat dan Ketentuan:\n"
                                "• Minimal pembelian Rp500.000.\n"
                                "• Maksimal potongan Rp100.000.\n"
                                "• Hanya dapat digunakan 1 kali "
                                "dalam satu transaksi.\n"
                                "• Tidak dapat digabungkan "
                                "dengan voucher lainnya.\n"
                                "• Berlaku untuk semua produk.",
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ==================================
                      // PROMO 2
                      // ==================================

                      ExpansionTile(
                        leading: const Icon(
                          Icons.local_offer,
                          color: Colors.orange,
                        ),

                        title: const Text(
                          "Voucher Diskon 30%",
                        ),

                        subtitle: const Text(
                          "Diskon maksimal Rp75.000",
                        ),

                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Syarat dan Ketentuan:\n"
                                "• Minimal pembelian Rp300.000.\n"
                                "• Maksimal potongan Rp75.000.\n"
                                "• Hanya berlaku untuk member.\n"
                                "• Tidak dapat diuangkan.\n"
                                "• Tidak dapat digabungkan "
                                "dengan promo lainnya.",
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ==================================
                      // PROMO 3
                      // ==================================

                      ExpansionTile(
                        leading: const Icon(
                          Icons.card_giftcard,
                          color: Colors.purple,
                        ),

                        title: const Text(
                          "Voucher Member 20%",
                        ),

                        subtitle: const Text(
                          "Khusus member SmartRetail",
                        ),

                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Syarat dan Ketentuan:\n"
                                "• Hanya berlaku bagi member "
                                "SmartRetail.\n"
                                "• Minimal transaksi Rp200.000.\n"
                                "• Maksimal potongan Rp50.000.\n"
                                "• Hanya dapat digunakan "
                                "1 kali sehari.\n"
                                "• Voucher tidak dapat "
                                "dipindahtangankan.",
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ==================================
                      // PROMO 4
                      // ==================================

                      ExpansionTile(
                        leading: const Icon(
                          Icons.shopping_bag,
                          color: Colors.green,
                        ),

                        title: const Text(
                          "Voucher Belanja Rp25.000",
                        ),

                        subtitle: const Text(
                          "Potongan langsung Rp25.000",
                        ),

                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Syarat dan Ketentuan:\n"
                                "• Minimal transaksi Rp150.000.\n"
                                "• Mendapatkan potongan langsung "
                                "Rp25.000.\n"
                                "• Hanya berlaku untuk "
                                "produk tertentu.\n"
                                "• Tidak dapat digabungkan "
                                "dengan voucher lainnya.\n"
                                "• Voucher berlaku sesuai "
                                "periode promo.",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // Sub-menu 2: Riwayat
  // ==========================================

  Widget _buildRiwayat() {
    if (_riwayatTransaksi.isEmpty) {
      return const Center(
        child: Text("Belum ada transaksi."),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text('ID Transaksi'),
          ),
          DataColumn(
            label: Text('Barang'),
          ),
          DataColumn(
            label: Text('Total'),
          ),
        ],

        rows: _riwayatTransaksi.map((trx) {
          return DataRow(
            cells: [
              DataCell(
                Text(trx['id']),
              ),
              DataCell(
                Text(trx['nama']),
              ),
              DataCell(
                Text(trx['total']),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ==========================================
  // Sub-menu 3: Informasi Toko
  // ==========================================

  Widget _buildInformasi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "SmartRetail Official Store",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const SelectableText(
            "Kode Lisensi Resmi: SMRT-2026-X890",
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),

          const Text(
            "(Tahan teks untuk menyalin)",
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. Halaman Formulir Pemesanan
// ==========================================

class OrderFormScreen extends StatefulWidget {
  final Map<String, dynamic> produk;

  const OrderFormScreen({
    Key? key,
    required this.produk,
  }) : super(key: key);

  @override
  State<OrderFormScreen> createState() =>
      _OrderFormScreenState();
}

class _OrderFormScreenState
    extends State<OrderFormScreen> {

  String _pengiriman = 'Reguler';

  bool _asuransi = false;

  bool _bubbleWrap = false;

  // Variabel khusus untuk Packing Kayu
  bool _packingKayu = false;

  DateTime? _tanggalPengambilan;

  TimeOfDay? _waktuPengambilan;

  // Nilai diskon dalam persen
  double _diskonMember = 0;

  bool _isDropship = false;

  // ==========================================
  // PERHITUNGAN HARGA
  // ==========================================

  int _ambilHargaProduk() {
    String harga = widget.produk['harga'].toString();

    // Menghapus Rp, titik, dan karakter lainnya
    harga = harga.replaceAll(RegExp(r'[^0-9]'), '');

    return int.tryParse(harga) ?? 0;
  }

  // ==========================================
  // MENGHITUNG POTONGAN
  // ==========================================

  int _hitungPotongan() {
    int harga = _ambilHargaProduk();

    double potongan =
        harga * (_diskonMember / 100);

    return potongan.round();
  }

  // ==========================================
  // MENGHITUNG TOTAL
  // ==========================================

  int _hitungTotal() {
    int harga = _ambilHargaProduk();

    int potongan = _hitungPotongan();

    return harga - potongan;
  }

  // ==========================================
  // FORMAT RUPIAH
  // ==========================================

  String _formatRupiah(int angka) {
    String angkaString = angka.toString();

    String hasil = '';

    int hitung = 0;

    for (int i = angkaString.length - 1;
        i >= 0;
        i--) {
      hasil = angkaString[i] + hasil;

      hitung++;

      if (hitung == 3 && i != 0) {
        hasil = '.$hasil';

        hitung = 0;
      }
    }

    return 'Rp $hasil';
  }

  // ==========================================
  // Pilih Tanggal
  // ==========================================

  void _pilihTanggal() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _tanggalPengambilan = picked;
      });
    }
  }

  // ==========================================
  // Pilih Waktu
  // ==========================================

  void _pilihWaktu() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _waktuPengambilan = picked;
      });
    }
  }

  // ==========================================
  // Proses Transaksi
  // ==========================================

  void _prosesTransaksi() {
    final BuildContext parentContext = context;

    int hargaAwal = _ambilHargaProduk();

    int potongan = _hitungPotongan();

    int totalAkhir = _hitungTotal();

    showModalBottomSheet(
      context: parentContext,
      builder: (BuildContext bottomSheetContext) {
        return Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment:
                CrossAxisAlignment.stretch,

            children: [
              const Text(
                'Rincian Biaya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Produk
              Text(
                'Produk: ${widget.produk['nama']}',
              ),

              const SizedBox(height: 5),

              // Harga awal
              Text(
                'Harga Awal: ${_formatRupiah(hargaAwal)}',
              ),

              const SizedBox(height: 5),

              // Pengiriman
              Text(
                'Pengiriman: $_pengiriman',
              ),

              const SizedBox(height: 5),

              // Persentase diskon
              Text(
                'Diskon: ${_diskonMember.toInt()}%',
              ),

              const SizedBox(height: 5),

              // Jumlah potongan
              Text(
                'Potongan: ${_formatRupiah(potongan)}',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),

              const Divider(),

              // Total akhir
              Text(
                'Total Bayar: ${_formatRupiah(totalAkhir)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: bottomSheetContext,

                    builder:
                        (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text(
                          'Konfirmasi Transaksi',
                        ),

                        content: Text(
                          'Produk: '
                          '${widget.produk['nama']}\n\n'
                          'Harga Awal: '
                          '${_formatRupiah(hargaAwal)}\n'
                          'Diskon: '
                          '${_diskonMember.toInt()}%\n'
                          'Potongan: '
                          '${_formatRupiah(potongan)}\n'
                          'Total Bayar: '
                          '${_formatRupiah(totalAkhir)}\n\n'
                          'Apakah Anda yakin ingin '
                          'memproses transaksi ini?',
                        ),

                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                dialogContext,
                              );
                            },
                            child: const Text(
                              'Batal',
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () {
                              // Tutup dialog
                              Navigator.pop(
                                dialogContext,
                              );

                              // Tutup bottom sheet
                              Navigator.pop(
                                bottomSheetContext,
                              );

                              // Kembalikan total setelah diskon
                              Navigator.pop(
                                parentContext,
                                _formatRupiah(
                                  totalAkhir,
                                ),
                              );
                            },

                            child: const Text(
                              'Setuju',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: const Text(
                  'Konfirmasi Akhir',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==========================================
  // Tampilan Form
  // ==========================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pesan: ${widget.produk['nama']}",
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),

        children: [

          // ==========================================
          // METODE PENGIRIMAN
          // ==========================================

          const Text(
            "Metode Pengiriman:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          RadioListTile(
            title: const Text('Reguler'),
            value: 'Reguler',
            groupValue: _pengiriman,

            onChanged: (val) {
              setState(() {
                _pengiriman = val.toString();
              });
            },
          ),

          RadioListTile(
            title: const Text('Kargo'),
            value: 'Kargo',
            groupValue: _pengiriman,

            onChanged: (val) {
              setState(() {
                _pengiriman = val.toString();
              });
            },
          ),

          RadioListTile(
            title: const Text('Instan'),
            value: 'Instan',
            groupValue: _pengiriman,

            onChanged: (val) {
              setState(() {
                _pengiriman = val.toString();
              });
            },
          ),

          const Divider(),

          // ==========================================
          // LAYANAN EKSTRA
          // ==========================================

          const Text(
            "Layanan Ekstra:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          CheckboxListTile(
            title: const Text(
              'Asuransi Pengiriman',
            ),

            value: _asuransi,

            onChanged: (val) {
              setState(() {
                _asuransi = val!;
              });
            },
          ),

          CheckboxListTile(
            title: const Text(
              'Bubble Wrap Ekstra',
            ),

            value: _bubbleWrap,

            onChanged: (val) {
              setState(() {
                _bubbleWrap = val!;
              });
            },
          ),

          CheckboxListTile(
            title: const Text(
              'Packing Kayu',
            ),

            value: _packingKayu,

            onChanged: (val) {
              setState(() {
                _packingKayu = val!;
              });
            },
          ),

          const Divider(),

          // ==========================================
          // JADWAL PENGAMBILAN
          // ==========================================

          const Text(
            "Jadwal Pengambilan:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,

            children: [
              ElevatedButton(
                onPressed: _pilihTanggal,

                child: const Text(
                  "Pilih Tanggal",
                ),
              ),

              ElevatedButton(
                onPressed: _pilihWaktu,

                child: const Text(
                  "Pilih Jam",
                ),
              ),
            ],
          ),

          // Menampilkan tanggal yang dipilih
          if (_tanggalPengambilan != null)
            Text(
              'Tanggal: '
              '${_tanggalPengambilan!.day}/'
              '${_tanggalPengambilan!.month}/'
              '${_tanggalPengambilan!.year}',
            ),

          if (_waktuPengambilan != null)
            Text(
              'Jam: '
              '${_waktuPengambilan!.format(context)}',
            ),

          const Divider(),

          // ==========================================
          // DISKON MEMBER
          // ==========================================

          Text(
            "Diskon Member: "
            "${_diskonMember.toInt()}%",

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Slider(
            value: _diskonMember,

            min: 0,

            max: 50,

            divisions: 10,

            label:
                '${_diskonMember.toInt()}%',

            onChanged: (val) {
              setState(() {
                _diskonMember = val;
              });
            },
          ),

          // ==========================================
          // HASIL PERHITUNGAN DISKON
          // ==========================================

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.grey[100],

              borderRadius:
                  BorderRadius.circular(10),

              border: Border.all(
                color: Colors.grey,
              ),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  'Harga Awal: '
                  '${_formatRupiah(
                    _ambilHargaProduk(),
                  )}',
                ),

                const SizedBox(height: 5),

                Text(
                  'Diskon: '
                  '${_diskonMember.toInt()}%',
                ),

                const SizedBox(height: 5),

                Text(
                  'Potongan: '
                  '${_formatRupiah(
                    _hitungPotongan(),
                  )}',

                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),

                const Divider(),

                Text(
                  'Total Setelah Diskon: '
                  '${_formatRupiah(
                    _hitungTotal(),
                  )}',

                  style: const TextStyle(
                    fontSize: 18,

                    fontWeight:
                        FontWeight.bold,

                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // ==========================================
          // DROPSHIP
          // ==========================================

          SwitchListTile(
            title: const Text(
              'Aktifkan mode Dropship',
            ),

            value: _isDropship,

            onChanged: (val) {
              setState(() {
                _isDropship = val;
              });
            },
          ),

          const SizedBox(height: 20),

          // ==========================================
          // PROSES TRANSAKSI
          // ==========================================

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.all(16),
            ),

            onPressed: _prosesTransaksi,

            child: const Text(
              'Proses Transaksi',

              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}