import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Revisi aman

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Sederhana',
      home: const ProfilPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key); // Revisi aman

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/foto.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Rida Dzakiyyyah',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 5),
                Text(
                  'Jakarta',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Seorang pelajar yang sedang belajar Flutter.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Status: pelajar/mahasiswa',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.email),
              label: const Text("Hubungi Saya"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
