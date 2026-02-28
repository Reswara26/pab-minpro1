import 'package:flutter/material.dart';
import '../models/pesawat.dart';

class FormPesawatPage extends StatefulWidget {
  final Pesawat? pesawat;

  const FormPesawatPage({super.key, this.pesawat});

  @override
  State<FormPesawatPage> createState() => _FormPesawatPageState();
}

class _FormPesawatPageState extends State<FormPesawatPage> {
  late TextEditingController namaController;
  late TextEditingController maskapaiController;
  late TextEditingController tahunController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.pesawat?.nama ?? '');
    maskapaiController = TextEditingController(text: widget.pesawat?.maskapai ?? '');
    tahunController = TextEditingController(text: widget.pesawat?.tahun ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pesawat == null ? 'Tambah Pesawat' : 'Edit Pesawat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Pesawat'),
            ),
            TextField(
              controller: maskapaiController,
              decoration: const InputDecoration(labelText: 'Maskapai'),
            ),
            TextField(
              controller: tahunController,
              decoration: const InputDecoration(labelText: 'Tahun Produksi'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final pesawatBaru = Pesawat(
                  nama: namaController.text,
                  maskapai: maskapaiController.text,
                  tahun: tahunController.text,
                );
                Navigator.pop(context, pesawatBaru);
              },
              child: Text(widget.pesawat == null ? 'Simpan' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}