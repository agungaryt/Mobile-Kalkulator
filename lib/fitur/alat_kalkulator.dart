import 'package:flutter/material.dart';

class AlatKalkulator extends StatefulWidget {
  const AlatKalkulator({super.key});

  @override
  _AlatKalkulatorState createState() => _AlatKalkulatorState();
}

class _AlatKalkulatorState extends State<AlatKalkulator> {
  final _kontrolerAngka1 = TextEditingController();
  final _kontrolerAngka2 = TextEditingController();
  String _operatorHitung = '+';
  String? _hasil;

  void _hitung() {
    final angka1 = double.tryParse(_kontrolerAngka1.text);
    final angka2 = double.tryParse(_kontrolerAngka2.text);
    if (angka1 == null || angka2 == null) return;

    double hasilAkhir = 0;
    switch (_operatorHitung) {
      case '+': hasilAkhir = angka1 + angka2; break;
      case '-': hasilAkhir = angka1 - angka2; break;
      case '*': hasilAkhir = angka1 * angka2; break;
      case '/': 
        if (angka2 == 0) {
          setState(() { _hasil = 'Eror'; });
          return;
        }
        hasilAkhir = angka1 / angka2; 
        break;
    }
    
    String hasilDiformat = hasilAkhir.toString();
    if (hasilDiformat.endsWith('.0')) {
      hasilDiformat = hasilDiformat.substring(0, hasilDiformat.length - 2);
    }
    
    setState(() {
      _hasil = hasilDiformat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _kontrolerAngka1,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Angka pertama',
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _operatorHitung,
            dropdownColor: const Color(0xFF262626),
            style: const TextStyle(color: Colors.white),
            items: const [
              DropdownMenuItem(value: '+', child: Text('+')),
              DropdownMenuItem(value: '-', child: Text('-')),
              DropdownMenuItem(value: '*', child: Text('×')),
              DropdownMenuItem(value: '/', child: Text('÷')),
            ],
            onChanged: (nilai) {
              if (nilai != null) {
                setState(() => _operatorHitung = nilai);
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _kontrolerAngka2,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Angka kedua',
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _hitung,
            child: const Text('Hitung'),
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
