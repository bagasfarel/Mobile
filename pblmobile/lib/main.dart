import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifikasi Pengajuan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> submissionList = [
    {
      'name': 'John Doe',
      'status': 'Pengajuan Belum Dapat Disetujui',
      'color': 'red',
    },
    {
      'name': 'John Doe',
      'status': 'Pengajuan Disetujui',
      'color': 'green',
    },
    {
      'name': 'John Doe',
      'status': 'Pengajuan sedang diproses',
      'color': 'blue',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.lightBlue[100], // Warna latar belakang seperti gambar
        title: Text(
          'NOTIFIKASI PENGAJUAN',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person,
                color: Colors.black), // Ikon User di samping lonceng
            onPressed: () {},
          ),
        ],
        elevation: 0, // Menghilangkan bayangan
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Pengajuan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    submissionList.length, // Jumlah pengajuan sesuai daftar
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 30,
                        child: Text('Foto'),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${submissionList[index]['name']} - Nama Dosen'),
                          Text(
                            'Pengajar Prodi\nInformasi Pengajuan',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        submissionList[index]['status']!,
                        style: TextStyle(
                          color: submissionList[index]['color'] == 'red'
                              ? Colors.red
                              : submissionList[index]['color'] == 'green'
                                  ? Colors.green
                                  : Colors.blue,
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Warna tombol biru
                        ),
                        onPressed: () {},
                        child: Text('Lihat'),
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
