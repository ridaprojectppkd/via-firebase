import 'package:flutter/material.dart';
import 'package:myapp/Tugas12/db_helper12.dart';
import 'package:myapp/Tugas11/modelang.dart';
import 'package:myapp/Tugas11/edit_anggota_screen.dart'; // Import the edit screen

class Tugas12n extends StatefulWidget {
  const Tugas12n({super.key});

  @override
  State<Tugas12n> createState() => _Tugas12nState();
}

class _Tugas12nState extends State<Tugas12n> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _visimisiController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<AnggotaModel> daftarAnggota = [];

  @override
  void initState() {
    muatData();
    super.initState();
  }

  Future<void> muatData() async {
    final data = await DBHelper.getAllAnggota();
    setState(() {
      daftarAnggota = data;
    });
  }

  Future<void> simpanData() async {
    final nama = _namaController.text;
    final email = _emailController.text;
    final visimisi = _visimisiController.text;
    final phone = _phoneController.text;

    if (nama.isNotEmpty) {
      await DBHelper.insertAnggota(
        AnggotaModel(
          nama: nama,
          email: email,
          visimisi: visimisi,
          phone: phone,
        ),
      );
      _namaController.clear();
      _emailController.clear();
      _visimisiController.clear();
      _phoneController.clear();
      muatData();
    }
  }

  Future<void> _deleteAnggota(int id) async {
    await DBHelper.deleteAnggota(id);
    muatData(); // Refresh data after delete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pendaftaran Anggota\nKomunitas Pantai Selatan⛺',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFA812F),
                Color(0xffF3C623),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Pendataan Anggota',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... (keep all your existing form fields)
                  // Your existing form fields remain unchanged
                ],
              ),
            ),
            Divider(height: 38),
            Text(
              'Anggota Terdaftar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: daftarAnggota.length,
                itemBuilder: (BuildContext context, int index) {
                  final anggota = daftarAnggota[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Details'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama: ${anggota.nama}'),
                                Text('Email: ${anggota.email}'),
                                Text('Visimisi: ${anggota.visimisi}'),
                                Text('Phone: ${anggota.phone}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Tutup'),
                              ),
                            ],
                          ),
                        );
                      },
                      leading: CircleAvatar(child: Text('${anggota.id}')),
                      title: Text(
                        anggota.nama,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${anggota.email}'),
                          Text('Visimisi: ${anggota.visimisi}'),
                          Text('Phone: ${anggota.phone}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit Button
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditAnggotaScreen(anggota: anggota),
                                ),
                              ).then((_) => muatData()); // Refresh after returning
                            },
                          ),
                          // Delete Button
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              bool confirm = await showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('Konfirmasi'),
                                  content: Text('Hapus data anggota ini?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx, false),
                                      child: Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx, true),
                                      child: Text('Hapus'),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await _deleteAnggota(anggota.id!);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}