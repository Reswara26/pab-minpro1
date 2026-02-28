import 'package:flutter/material.dart';
import '../models/pesawat.dart';
import 'form_pesawat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Pesawat> _daftarPesawat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pesawat')),
      body: ListView.builder(
        itemCount: _daftarPesawat.length,
        itemBuilder: (context, index) {
          final pesawat = _daftarPesawat[index];
          return Card(
            child: ListTile(
              title: Text(pesawat.nama),
              subtitle: Text('${pesawat.maskapai} - ${pesawat.tahun}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      final updatedPesawat = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPesawatPage(
                            pesawat: pesawat,
                          ),
                        ),
                      );
                      if (updatedPesawat != null) {
                        setState(() {
                          _daftarPesawat[index] = updatedPesawat;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _daftarPesawat.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPesawat = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormPesawatPage(),
            ),
          );
          if (newPesawat != null) {
            setState(() {
              _daftarPesawat.add(newPesawat);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}