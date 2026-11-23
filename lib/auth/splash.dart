import 'package:flutter/material.dart';
import 'dart:async';
import 'welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'S',
          style: TextStyle(
            fontSize: 65,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1E4ED8),
            fontFamily: 'serif',
          ),
        ),
      ),
    );
  }
}
