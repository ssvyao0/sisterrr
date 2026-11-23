import 'package:flutter/material.dart';

class JurnalPklPage extends StatefulWidget {
  const JurnalPklPage({super.key});

  @override
  State<JurnalPklPage> createState() => _JurnalPklPageState();
}

class _JurnalPklPageState extends State<JurnalPklPage> {
  int _selectedTab = 0; // 0 = Jurnal, 1 = Bimbingan
  final List<Map<String, String>> _jurnalList = [];

  // Controller buat form tambah
  final _tanggalController = TextEditingController();
  final _kegiatanController = TextEditingController();
  final _tempatController = TextEditingController();

  void _showTambahDialog() {
    _tanggalController.clear();
    _kegiatanController.clear();
    _tempatController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Tambah Jurnal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tanggalController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal',
                  hintText: 'Contoh: 23 Nov 2026',
                  filled: true,
                  fillColor: Color(0xFFD9EAF0),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _tempatController,
                decoration: const InputDecoration(
                  labelText: 'Tempat PKL',
                  hintText: 'Contoh: PT. Sinar Jaya',
                  filled: true,
                  fillColor: Color(0xFFD9EAF0),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _kegiatanController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Kegiatan Hari Ini',
                  hintText: 'Tulis kegiatan kamu hari ini...',
                  filled: true,
                  fillColor: Color(0xFFD9EAF0),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F2F5C),
            ),
            onPressed: () {
              if (_kegiatanController.text.isEmpty) return;
              setState(() {
                _jurnalList.insert(0, {
                  'tanggal': _tanggalController.text.isEmpty
                      ? 'Hari ini'
                      : _tanggalController.text,
                  'tempat': _tempatController.text.isEmpty
                      ? 'Tempat PKL'
                      : _tempatController.text,
                  'kegiatan': _kegiatanController.text,
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Simpan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2F8),
      body: Column(
        children: [
          // HEADER BIRU DONGKER - SAMA KAYAK FOTO KAMU
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 25),
            color: const Color(0xFF0F2F5C),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Jurnal PKL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40), // biar judulnya pas tengah
              ],
            ),
          ),
          // ISI
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: _selectedTab == 0
                        ? _jurnalList.isEmpty
                              // KALAU MASIH KOSONG - SAMA KAYAK FOTO KAMU
                              ? const Center(
                                  child: Text(
                                    'Daftar jurnal masih kosong\nBelum ada data untuk ditampilkan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      height: 1.5,
                                    ),
                                  ),
                                )
                              // KALAU UDAH ADA ISINYA
                              : ListView.builder(
                                  itemCount: _jurnalList.length,
                                  itemBuilder: (context, index) {
                                    final j = _jurnalList[index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDCEEFF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                j['tanggal']!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                j['tempat']!,
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            j['kegiatan']!,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                        : const Center(
                            child: Text(
                              'Belum ada bimbingan\nSilahkan hubungi pembimbing kamu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                height: 1.5,
                              ),
                            ),
                          ),
                  ),
                  // TOMBOL + TAMBAH - CUMA MUNCUL DI TAB JURNAL
                  if (_selectedTab == 0)
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _showTambahDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F2F5C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          '+ Tambah',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1.5,
                    height: 30,
                  ),
                  // BAWAH: JURNAL | BIMBINGAN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _tabButton(0, Icons.book, 'Jurnal'),
                      _tabButton(1, Icons.group, 'Bimbingan'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(int index, IconData icon, String label) {
    final isActive = _selectedTab == index;
    return InkWell(
      onTap: () => setState(() => _selectedTab = index),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
            color: isActive ? const Color(0xFF0F2F5C) : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? const Color(0xFF0F2F5C) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
