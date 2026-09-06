import 'package:flutter/material.dart';

class AlatGanjilGenap extends StatefulWidget {
  const AlatGanjilGenap({super.key});

  @override
  _AlatGanjilGenapState createState() => _AlatGanjilGenapState();
}

class _AlatGanjilGenapState extends State<AlatGanjilGenap> {
  final _kontrolerAngka = TextEditingController();
  String? _hasil;

  void _cekAngka() {
    final angka = int.tryParse(_kontrolerAngka.text);
    if (angka == null) return;
    
    setState(() {
      _hasil = angka % 2 == 0 ? 'Genap' : 'Ganjil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _kontrolerAngka,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Masukkan bilangan bulat (Contoh: 42)',
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _cekAngka,
            child: const Text('Cek Angka'),
          ),
          const SizedBox(height: 16),
          if (_hasil != null)
            Text(
              'Hasil: $_hasil',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
        ],
      ),
    );
  }
}
