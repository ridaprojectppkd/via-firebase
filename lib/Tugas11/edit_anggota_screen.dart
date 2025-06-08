// File: lib/Tugas11/edit_anggota_screen.dart
import 'package:flutter/material.dart';

import 'package:myapp/Tugas12/db_helper12.dart';
import 'package:myapp/Tugas11/modelang.dart';

class EditAnggotaScreen extends StatefulWidget {
  final AnggotaModel anggota;

  const EditAnggotaScreen({super.key, required this.anggota});

  @override
  _EditAnggotaScreenState createState() => _EditAnggotaScreenState();
}

class _EditAnggotaScreenState extends State<EditAnggotaScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _emailController;
  late TextEditingController _visimisiController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    // Isi form dengan data anggota yang dipilih
    _namaController = TextEditingController(text: widget.anggota.nama);
    _emailController = TextEditingController(text: widget.anggota.email);
    _visimisiController = TextEditingController(text: widget.anggota.visimisi);
    _phoneController = TextEditingController(text: widget.anggota.phone);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _visimisiController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateAnggota() async {
    if (_formKey.currentState!.validate()) {
      await DBHelper.updateAnggota(
        AnggotaModel(
          id: widget.anggota.id, // Gunakan ID yang sama untuk update
          nama: _namaController.text,
          email: _emailController.text,
          visimisi: _visimisiController.text,
          phone: _phoneController.text,
        ),
      );
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Anggota'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _updateAnggota,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _visimisiController,
                decoration: InputDecoration(labelText: 'Visi Misi'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'No. HP'),
              ),
              ElevatedButton(
                onPressed: _updateAnggota,
                child: Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}