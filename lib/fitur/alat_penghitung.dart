import 'package:flutter/material.dart';

class AlatPenghitung extends StatefulWidget {
  const AlatPenghitung({super.key});

  @override
  _AlatPenghitungState createState() => _AlatPenghitungState();
}

class _AlatPenghitungState extends State<AlatPenghitung> {
  final _kontrolerTeks = TextEditingController();
  int _jumlahKarakter = 0;
  int _jumlahAngka = 0;

  @override
  void initState() {
    super.initState();
    _kontrolerTeks.addListener(_perbaruiHitungan);
  }

  void _perbaruiHitungan() {
    final teks = _kontrolerTeks.text;
    setState(() {
      _jumlahKarakter = teks.length;
      _jumlahAngka = teks.replaceAll(RegExp(r'[^0-9]'), '').length;
    });
  }

  @override
  void dispose() {
    _kontrolerTeks.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _kontrolerTeks,
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Masukkan teks atau angka...',
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white38),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Total Karakter: $_jumlahKarakter',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Total Angka: $_jumlahAngka',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
