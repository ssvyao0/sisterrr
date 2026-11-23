import 'package:flutter/material.dart';
import 'beranda_page.dart';
import 'lms_page.dart';
import 'presensi_page.dart';
import 'cbt_page.dart';
import 'akun_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = const [
    BerandaPage(),
    LmsPage(),
    PresensiPage(),
    CbtPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5FA),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0A2A5E),
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'LMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Presensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows_outlined),
            label: 'CBT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
