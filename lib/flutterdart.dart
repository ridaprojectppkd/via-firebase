import 'package:flutter/material.dart';

class MeetSatu extends StatelessWidget {
  const MeetSatu({super.key, super..key})

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Pertemuan 1"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
              ),
              child: Text(
                'Menu Navigasi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigasi ke halaman Home
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Account'),
              onTap: () {
                // Navigasi ke halaman Account
                Navigator.pop(context); // Tutup drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("nama saya"),
            Text("Judul buku"),
            Text("widget column itu dari atas ke bawah"),
            Text("😒😪😪😯😫😫🤬😡🤬😡😡🤬"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("gambar1"),
                Text("gambar2"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MeetSatu(),
    ),
  );
}