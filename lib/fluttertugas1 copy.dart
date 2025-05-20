import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Sederhana',
      home: ProfilPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
///widgetbuild fungsinya membangun tampilan UI 
//////materi container
Container(
  height:40,
  width: double,infinity,
  //color: Colors.lightBlueAccent, jangan letakan ini diluar box decoration 
  ///kalau pake box deoration
  ///border radius bikin melengkung
  ///bisa pakai border instatn itu pakai border all
  child: Column(
    children: [
      Text("pengumumuman"),
      Text("YTH. PPKD JP"),
      Text("Hari ini telah terdaftar"),
    ]
  )),
)


class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        ///appbar itu yang atas
        backgroundColor: Colors.teal,
        centerTitle: true,
        ///center title true itu artinya letakan judul app bar ditengah (true=aktif) 
        ///kalo false nanti munculnya tetep dikiri karena default android itu dikiri
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // rata kiri
          children: [
            Text(
              'Rida Dzakiyyyah',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
              ///baris 1 nama lengkap font besar
            ),
            SizedBox(height: 10), // jarak antar baris
            ///sidesbox itu spaci
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                ///sidebox itu ngatur jarak antar widget
                SizedBox(width: 5),
                Text(
                  'Jakarta',
                  style: TextStyle(fontSize: 16),
                ), 
                ///fungsi row itu untuk nyusun widget kiri ke kanan
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Seorang pelajar yang sedang belajar Flutter.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              'Seorang pelajar anjay.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
