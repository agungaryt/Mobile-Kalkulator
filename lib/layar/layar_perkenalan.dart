import 'package:flutter/material.dart';

class LayarPengenalan extends StatelessWidget {
  final VoidCallback saatSelesai;

  const LayarPengenalan({super.key, required this.saatSelesai});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anggota Kelompok')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ListTile(
                  title: Text(
                    'Rahmat Agung Aryanto',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '124240052',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Tasyakur Maulana Istna',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '124240053',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/arya.jpeg'),
                  ),
                  title: Text(
                    'Arya Alifia Al Ashar',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '124240061',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: saatSelesai,
              child: const Text('Selanjutnya'),
            ),
          ),
        ],
      ),
    );
  }
}
