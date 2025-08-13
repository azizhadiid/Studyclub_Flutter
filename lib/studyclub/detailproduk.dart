import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studyclubapp/main.dart';

class DetailProdukPage extends StatelessWidget {
  final String nama;
  final String gambar;
  final int harga;
  final String detail;

  const DetailProdukPage({
    super.key,
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    // Variabel untuk menyimpan index yang terpilih di bottom navigation bar
    // Nilai ini bisa disesuaikan atau di-pass dari halaman sebelumnya jika diperlukan
    const int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6366F1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Kembali ke halaman sebelumnya (halaman utama)
            Navigator.pop(context);
          },
        ),
        title: Text(
          nama,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian Gambar Produk
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(gambar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bagian Detail Produk
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Deskripsi Produk",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    detail,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  // Contoh Tombol Aksi
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Tambahkan produk ke riwayat pembelian
                        riwayatPembelian.add({
                          'nama': nama,
                          'gambar': gambar,
                          'harga': harga,
                          'detail': detail,
                        });

                        // Navigasi ke halaman riwayat beli
                        Navigator.pushNamed(context, '/riwayat');
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Beli Sekarang'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bagian Bottom Navigation Bar (disalin dari halaman home)
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF6366F1),
          unselectedItemColor: const Color(0xFF9CA3AF),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            HapticFeedback.lightImpact();
            // Perilaku navigasi di sini disesuaikan agar tidak mengganggu halaman detail
            if (index == 0)
              Navigator.pushReplacementNamed(context, '/'); // Kembali ke Home
            if (index == 1)
              Navigator.pushReplacementNamed(
                context,
                '/profile',
              ); // Atau navigasi ke halaman profile
          },
        ),
      ),
    );
  }
}
