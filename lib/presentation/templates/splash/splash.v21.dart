import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV21Screen extends StatefulWidget {
  const SplashV21Screen({super.key});

  @override
  State<SplashV21Screen> createState() => _SplashV21ScreenState();
}

class _SplashV21ScreenState extends State<SplashV21Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Controller setup (Smooth 1.5 seconds)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // 2. Define Animations

    // Fade In (Global)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Scale: Starts slightly larger and settles down (Focus effect)
    _scaleAnimation = Tween<double>(begin: 1.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    // Slide: Text moves up gently
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    // 3. Start Animation
    _controller.forward();

    // 4. Navigate to Next Screen
    Timer(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //       builder: (_) => const HomeScreen()), // Replace with your screen
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
      backgroundColor: Colors.white, // Simple, Clean Background
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- LOGO SECTION ---
              ScaleTransition(
                scale: _scaleAnimation,
                child: const Icon(
                  Icons.bolt_rounded, // Example Icon
                  color: Colors.black,
                  size: 50,
                ),
              ),
              const SizedBox(height: 15), // Breathing room

              // --- TEXT SECTION ---
              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    Text(
                      "Rawaan".toUpperCase(),
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold, // Thick, modern font
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Simple. Fast. Creative.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey, // Subtle secondary text
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- DUMMY HOME SCREEN ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Home Screen")));
  }
}
