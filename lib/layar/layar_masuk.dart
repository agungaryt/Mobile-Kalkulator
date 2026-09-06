import 'package:flutter/material.dart';

class LayarMasuk extends StatefulWidget {
  final Function(String) saatMasuk;

  const LayarMasuk({super.key, required this.saatMasuk});

  @override
  _LayarMasukState createState() => _LayarMasukState();
}

class _LayarMasukState extends State<LayarMasuk> {
  final _kontrolerNamaPengguna = TextEditingController();
  final _kontrolerKataSandi = TextEditingController();

  void _tanganiMasuk() {
    if (_kontrolerNamaPengguna.text.isNotEmpty && _kontrolerKataSandi.text.isNotEmpty) {
      widget.saatMasuk(_kontrolerNamaPengguna.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masuk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selamat Datang Kembali!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _kontrolerNamaPengguna,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Nama Pengguna',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _kontrolerKataSandi,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Kata Sandi',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _tanganiMasuk,
              child: const Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}
