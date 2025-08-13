import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageStudyClub extends StatefulWidget {
  const HomePageStudyClub({super.key});
  final String title = 'Study Club Home';

  @override
  State<HomePageStudyClub> createState() => _HomePageStudyClubState();
}

class _HomePageStudyClubState extends State<HomePageStudyClub> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 236, 236, 234),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6366F1),
      ),
      // Bagian Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rekomendasi",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  listItem(
                    nama: 'Iphone 12',
                    harga: 6000000,
                    gambar:
                        "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400&h=300&fit=crop",
                    detail: 'Smartphone dengan kamera terbaik di kelasnya',
                  ),
                  listItem(
                    nama: 'hoodie',
                    harga: 6000000,
                    gambar:
                        "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop",
                    detail: 'Hoodie nyaman untuk cuaca dingin',
                  ),
                  listItem(
                    nama: 'apple watch',
                    harga: 6000000,
                    gambar:
                        "https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=300&fit=crop",
                    detail: 'Jam tangan pintar dengan berbagai fitur kesehatan',
                  ),
                  listItem(
                    nama: 'Laptop',
                    harga: 8500000,
                    gambar:
                        "https://images.unsplash.com/photo-1532634922-8fe0b757fb13?w=400&h=300&fit=crop",
                    detail: 'Laptop dengan spesifikasi tinggi untuk gaming',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bagian Bottom Navigation Bar
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
            setState(() {
              selectedIndex = index;
            });
            if (index == 0) Navigator.pushReplacementNamed(context, '/');
            if (index == 1) Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
      ),
    );
  }

  Widget listItem({
    required String nama,
    required int harga,
    required String gambar,
    required String detail,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detailproduk',
            arguments: {
              'nama': nama,
              'gambar': gambar,
              'harga': harga,
              'detail': detail,
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
                child: Image.network(gambar, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/detailproduk',
                          arguments: {
                            'nama': nama,
                            'gambar': gambar,
                            'harga': harga,
                            'detail': detail,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Detail Produk',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
