import 'package:backdrop/backdrop.dart';
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
  String kategoriAwal = "Semua Kategori";

  final List<Map<String, dynamic>> listProduct = [
    {
      "nama": 'Iphone 12',
      "harga": 6000000,
      "gambar":
          "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400&h=300&fit=crop",
      "detail": 'Smartphone dengan kamera terbaik di kelasnya',
      "kategori": 'Smartphone',
    },
    {
      "nama": 'hoodie',
      "harga": 6000000,
      "gambar":
          "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop",
      "detail": 'Hoodie nyaman untuk cuaca dingin',
      "kategori": 'Pakaian',
    },
    {
      "nama": 'apple watch',
      "harga": 6000000,
      "gambar":
          "https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=300&fit=crop",
      "detail": 'Jam tangan pintar dengan berbagai fitur kesehatan',
      "kategori": 'Gadget',
    },
    {
      "nama": 'Laptop',
      "harga": 8500000,
      "gambar":
          "https://images.unsplash.com/photo-1532634922-8fe0b757fb13?w=400&h=300&fit=crop",
      "detail": 'Laptop dengan spesifikasi tinggi untuk gaming',
      "kategori": 'Elektronik',
    },
  ];

  late List<String> uniqueKategori;

  @override
  void initState() {
    super.initState();
    // Mendapatkan kategori unik dari listProduct dan menambahkan "Semua Kategori"
    uniqueKategori = [
      'Semua Kategori',
      ...listProduct.map((e) => e['kategori'] as String).toSet().toList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final kategoriTerpilih = kategoriAwal == "Semua Kategori"
        ? listProduct
        : listProduct
              .where((item) => item['kategori'] == kategoriAwal)
              .toList();
    return BackdropScaffold(
      frontLayerBorderRadius: BorderRadius.zero,
      appBar: BackdropAppBar(
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

      backLayer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header "Pilih Kategori" dengan teks putih
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              "Pilih Kategori",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Radio button dan list kategori
          Expanded(
            child: ListView.builder(
              itemCount: uniqueKategori.length,
              itemBuilder: (context, index) {
                final kategori = uniqueKategori[index];
                return RadioListTile<String>(
                  title: Text(
                    kategori,
                    style: TextStyle(
                      color: Colors.white, // Warna teks kategori menjadi putih
                    ),
                  ),
                  value: kategori,
                  groupValue: kategoriAwal,
                  activeColor: Colors.white, // Warna radio button yang aktif
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        kategoriAwal = value;
                      });
                      Backdrop.of(context).fling();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Bagian Front Layer
      frontLayer: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rekomendasi - ${kategoriTerpilih.length} item",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16.0),
              // Menggunakan GridView.builder agar lebih dinamis
              GridView.builder(
                itemCount: kategoriTerpilih.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.7, // Sesuaikan aspek rasio jika perlu
                ),
                itemBuilder: (context, index) {
                  final item = kategoriTerpilih[index];
                  return listItem(
                    nama: item['nama'],
                    harga: item['harga'],
                    gambar: item['gambar'],
                    detail: item['detail'],
                    kategori: item['kategori'],
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // Bagian Body
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const Text(
      //           "Rekomendasi",
      //           style: TextStyle(
      //             fontSize: 24.0,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.black87,
      //           ),
      //         ),
      //         const SizedBox(height: 16.0),
      //         GridView.count(
      //           crossAxisCount: 2,
      //           crossAxisSpacing: 16.0,
      //           mainAxisSpacing: 16.0,
      //           shrinkWrap: true,
      //           physics: const NeverScrollableScrollPhysics(),
      //           children: kategoriTerpilih.map((item) {
      //             return listItem(
      //               nama: item['nama'],
      //               harga: item['harga'],
      //               gambar: item['gambar'],
      //               detail: item['detail'],
      //               kategori: item['kategori'],
      //             );
      //           }).toList(),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

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
    required String kategori,
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

                  SizedBox(height: 4.0),
                  Text(
                    kategori,
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
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
