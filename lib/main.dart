import 'package:flutter/material.dart';
import 'package:studyclubapp/studyclub/detailproduk.dart';
import 'package:studyclubapp/studyclub/home_apge.dart';
import 'package:studyclubapp/studyclub/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        fontFamily: 'Inter',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePageStudyClub(),
        '/profile': (context) => const ProfilePageStudyClub(),
        '/detailproduk': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return DetailProdukPage(
            nama: args['nama'],
            gambar: args['gambar'],
            harga: args['harga'],
            detail: args['detail'],
          );
        },
      },
    );
  }
}
