import 'package:flutter/material.dart';

import '../fitur/alat_kalkulator.dart';
import '../fitur/alat_ganjil_genap.dart';
import '../fitur/alat_penghitung.dart';

class LayarBeranda extends StatefulWidget {
  final String namaPengguna;

  const LayarBeranda({super.key, required this.namaPengguna});

  @override
  _LayarBerandaState createState() => _LayarBerandaState();
}

class _LayarBerandaState extends State<LayarBeranda> {
  int _indeksSaatIni = 0;

  final List<Widget> _alat = const [
    AlatKalkulator(),
    AlatGanjilGenap(),
    AlatPenghitung(),
  ];

  final List<String> _judulLayar = [
    'Kalkulator',
    'Ganjil Genap',
    'Hitung Karakter',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_judulLayar[_indeksSaatIni]),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Halo, ${widget.namaPengguna}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: _alat[_indeksSaatIni],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksSaatIni,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: const Color(0xFF262626),
        onTap: (indeks) => setState(() => _indeksSaatIni = indeks),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag),
            label: 'Ganjil/Genap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Teks',
          ),
        ],
      ),
    );
  }
}
