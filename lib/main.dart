import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'layar/layar_perkenalan.dart';
import 'layar/layar_masuk.dart';
import 'layar/layar_beranda.dart';

void main() {
  runApp(const AplikasiKalkulator());
}

class AplikasiKalkulator extends StatelessWidget {
  const AplikasiKalkulator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      home: const PengaturLayarUtama(),
    );
  }
}

class PengaturLayarUtama extends StatefulWidget {
  const PengaturLayarUtama({super.key});

  @override
  _PengaturLayarUtamaState createState() => _PengaturLayarUtamaState();
}

class _PengaturLayarUtamaState extends State<PengaturLayarUtama> {
  String layarSekarang = 'pengenalan'; // pengenalan, masuk, beranda
  String namaPengguna = '';

  void pindahKeLayar(String layarBaru) {
    setState(() {
      layarSekarang = layarBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (layarSekarang) {
      case 'pengenalan':
        return LayarPengenalan(
          saatSelesai: () => pindahKeLayar('masuk'),
        );
      case 'masuk':
        return LayarMasuk(
          saatMasuk: (nama) {
            namaPengguna = nama;
            pindahKeLayar('beranda');
          },
        );
      case 'beranda':
        return LayarBeranda(
          namaPengguna: namaPengguna,
        );
      default:
        return const Scaffold(body: Center(child: Text('Terjadi Kesalahan', style: TextStyle(color: Colors.white))));
    }
  }
}
