import 'package:flutter/material.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  // INI KUNCINYA - pake static biar nggak ke-reset pas pindah halaman
  static bool sudahFoto = false;
  static bool sudahKirim = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: Text(
              'Presensi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Senin, 01 Nov 2026 | XI RPL 1',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.location_on, color: Colors.green, size: 18),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'JL Raya Purwandaru, Km. 4, Bukateja, Purbalingga, Jawa Tengah, 53382, Indonesia',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Cek Ulang Lokasi',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(
                  sudahFoto ? Icons.check_circle : Icons.camera_alt,
                  size: 48,
                  color: sudahFoto ? Colors.green : const Color(0xFF0F2F5C),
                ),
                const SizedBox(height: 8),
                Text(
                  sudahKirim
                      ? 'Presensi Berhasil!'
                      : sudahFoto
                      ? 'Foto Berhasil Diambil'
                      : 'Ambil Foto Selfie',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: sudahKirim
                        ? null
                        : () {
                            setState(() {
                              sudahFoto = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Foto wajah berhasil diambil!'),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sudahFoto
                          ? Colors.green
                          : const Color(0xFF0F2F5C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      sudahKirim
                          ? 'SUDAH PRESENSI'
                          : sudahFoto
                          ? 'BERHASIL PRESENSI'
                          : 'AMBIL FOTO WAJAH',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (sudahFoto && !sudahKirim)
                        ? () {
                            setState(() {
                              sudahKirim = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Presensi Berhasil Dikirim!'),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sudahKirim
                          ? Colors.green
                          : Colors.grey.shade300,
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      sudahKirim ? 'SUDAH DIKIRIM' : 'KIRIM PRESENSI',
                      style: TextStyle(
                        color: sudahKirim ? Colors.white : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
