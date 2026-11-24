import 'package:flutter/material.dart';

class DataDiriPage extends StatelessWidget {
  const DataDiriPage({super.key});

  Widget _item(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A3A5E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Data Diri',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/login.jpg'),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Itoshi Rin',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'NIS 9249 • XI RPL',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _item('Nama Lengkap', 'Itoshi Rin'),
                Divider(height: 1, color: Color(0xFFD9EAF0)),
                _item('NIS', '9249'),
                Divider(height: 1, color: Color(0xFFD9EAF0)),
                _item('Kelas', 'XI'),
                Divider(height: 1, color: Color(0xFFD9EAF0)),
                _item('Jurusan', 'Rekayasa Perangkat Lunak'),
                Divider(height: 1, color: Color(0xFFD9EAF0)),
                _item(
                  'Tempat, Tanggal Lahir',
                  'Kota Kamakura, 9 September. 2010',
                ),
                Divider(height: 1, color: Color(0xFFD9EAF0)),
                _item('Jenis Kelamin', 'Laki-laki'),
                Divider(height: 1, color: Color(0xFFD9EAF0)),
                _item('Alamat', 'Purbalingga'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
