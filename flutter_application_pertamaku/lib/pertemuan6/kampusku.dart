import 'package:flutter/material.dart';

void main() {
  runApp(const KampusKuApp());
}

class KampusKuApp extends StatelessWidget {
  const KampusKuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KampusKu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Aplikasi dimulai dari halaman Login
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==========================================
// 1. HALAMAN AUTHENTIKASI (DUMMY)
// ==========================================

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login KampusKu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Dummy Login: Langsung masuk ke MainScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text('Belum punya akun? Register di sini'),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register KampusKu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'NIM', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Nama Lengkap', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Dummy Register: Kembali ke halaman login
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registrasi Berhasil! Silakan Login.')),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. MAIN SCREEN (NAVIGASI & DRAWER)
// ==========================================

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Daftar Halaman untuk navigasi
  final List<Widget> _pages = [
    const HomeScreen(),
    const BeritaScreen(),
    const KontakScreen(),
    const ProfilScreen(),
  ];

  final List<String> _titles = ['Home', 'Berita', 'Kontak', 'Profil'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Menutup drawer jika dinavigasi dari drawer
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu KampusKu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Berita'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone),
              title: const Text('Kontak'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => _onItemTapped(3),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ==========================================
// 3. HALAMAN HOME (TABBAR)
// ==========================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Beranda'),
              Tab(text: 'Artikel'),
              Tab(text: 'Akun'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildBerandaTab(),
                _buildArtikelTab(context),
                _buildAkunTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Tab 1: Beranda (SelectableText)
  Widget _buildBerandaTab() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SelectableText(
          "Selamat Datang di KampusKu App!\n\nIni adalah aplikasi sistem informasi akademik mahasiswa. Anda dapat menyorot dan menyalin teks ini (Selectable Text).",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Tab 2: Artikel (ListView.builder)
  Widget _buildArtikelTab(BuildContext context) {
    final List<Map<String, String>> dummyArtikel = List.generate(
      5,
      (index) => {
        "judul": "Teknologi AI Masa Kini Bagian ${index + 1}",
        "ringkasan": "Ini adalah ringkasan singkat dari artikel ke-${index + 1} yang membahas tentang kecerdasan buatan.",
        "gambar": "https://picsum.photos/seed/artikel$index/200/150",
        "isi": "Isi lengkap artikel ke-${index + 1}. Kecerdasan buatan kini merambah berbagai bidang, mulai dari pendidikan hingga industri kesehatan..."
      },
    );

    return ListView.builder(
      itemCount: dummyArtikel.length,
      itemBuilder: (context, index) {
        final artikel = dummyArtikel[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Image.network(artikel["gambar"]!, width: 80, fit: BoxFit.cover),
            title: Text(artikel["judul"]!),
            subtitle: Text(artikel["ringkasan"]!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtikelDetailScreen(artikel: artikel),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Tab 3: Akun (DataTable)
  Widget _buildAkunTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('NIM', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Program Studi', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [DataCell(Text('20210001')), DataCell(Text('Gefira Nazibah')), DataCell(Text('Teknik Informatika'))]),
          DataRow(cells: [DataCell(Text('20210002')), DataCell(Text('Salsa Amelia')), DataCell(Text('Sistem Informasi'))]),
          DataRow(cells: [DataCell(Text('20210003')), DataCell(Text('Tsenia Amelia')), DataCell(Text('Ilmu Komputer'))]),
        ],
      ),
    );
  }
}

// Detail Artikel
class ArtikelDetailScreen extends StatelessWidget {
  final Map<String, String> artikel;
  const ArtikelDetailScreen({Key? key, required this.artikel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(artikel["judul"]!)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(artikel["gambar"]!, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(artikel["isi"]!, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. HALAMAN BERITA (ListTile -> Detail + YouTube)
// ==========================================

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyBerita = List.generate(
      3,
      (index) => {
        "judul": "Berita Kampus Terkini ${index + 1}",
        "gambar": "https://picsum.photos/seed/berita$index/200/200",
        "isi": "Universitas mengadakan acara seminar nasional teknologi informasi pada minggu ini.",
      },
    );

    return ListView(
      children: dummyBerita.map((berita) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.newspaper, color: Colors.blue),
            title: Text(berita["judul"]!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BeritaDetailScreen(berita: berita),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}

// Detail Berita (Dengan Placeholder Video YouTube)
class BeritaDetailScreen extends StatelessWidget {
  final Map<String, String> berita;
  const BeritaDetailScreen({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Berita')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(berita["gambar"]!, width: double.infinity, height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(berita["judul"]!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(berita["isi"]!, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            
            // Placeholder Video YouTube
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_circle_fill, color: Colors.red, size: 60),
                    SizedBox(height: 8),
                    Text('Video YouTube', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. HALAMAN KONTAK (List Dosen)
// ==========================================

class KontakScreen extends StatelessWidget {
  const KontakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dosen = [
      {"nama": "Erick Febriyanto, S.Kom., M.T.I.", "hp": "081234567890"},
      {"nama": "Siti Nurhaliza, S.Kom., M.T.", "hp": "081987654321"},
      {"nama": "Prof. Ahmad Dhani, Ph.D.", "hp": "082112233445"},
    ];

    return ListView.builder(
      itemCount: dosen.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(dosen[index]["nama"]!),
          subtitle: Text("HP: ${dosen[index]["hp"]!}"),
          trailing: const Icon(Icons.phone, color: Colors.green),
        );
      },
    );
  }
}

// ==========================================
// 6. HALAMAN PROFIL (Stack)
// ==========================================

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Gambar Mahasiswa
          Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage('Images/muka.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay Teks
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Text(
              'Gefira Nazibah\nNIM: 10602016',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}