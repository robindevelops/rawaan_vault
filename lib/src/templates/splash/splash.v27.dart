import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV27Screen extends StatefulWidget {
  const SplashV27Screen({super.key});

  @override
  State<SplashV27Screen> createState() => _SplashV27ScreenState();
}

class _SplashV27ScreenState extends State<SplashV27Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Navigate after animation
    Future.delayed(const Duration(milliseconds: 2200), () {
      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (_, __, ___) => const HomeScreen(),
      //     transitionsBuilder: (_, animation, __, child) {
      //       return FadeTransition(opacity: animation, child: child);
      //     },
      //   ),
      // );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06C167),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Rawaan".toUpperCase(),
                  style: GoogleFonts.fjallaOne(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("ACCESS GRANTED",
            style: TextStyle(color: Colors.white, letterSpacing: 2)),
      ),
    );
  }
}
