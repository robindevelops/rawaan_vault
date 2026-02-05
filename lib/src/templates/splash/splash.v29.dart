import 'dart:async';
import 'package:flutter/material.dart';

class SplashV29Screen extends StatefulWidget {
  const SplashV29Screen({super.key});

  @override
  State<SplashV29Screen> createState() => _SplashV29ScreenState();
}

class _SplashV29ScreenState extends State<SplashV29Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _topSlide;
  late Animation<Offset> _bottomSlide;
  late Animation<double> _lineWidth;
  late Animation<double> _textScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // 1. The Line expands first (0.0 to 1.0 width)
    _lineWidth = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOutExpo),
      ),
    );

    // 2. Top Panel slides UP
    _topSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOutQuart),
      ),
    );

    // 3. Bottom Panel slides DOWN
    _bottomSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOutQuart),
      ),
    );

    // 4. Text gently scales up as it is revealed (Parallax feel)
    _textScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutBack),
      ),
    );

    // Start Sequence
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.forward();
    });

    // Navigate Away
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
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
      // The Base Layer (What is revealed)
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- LAYER 1: The Content (Hidden initially) ---
          Center(
            child: ScaleTransition(
              scale: _textScale,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Rawaan',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.black, // Stark contrast
                      letterSpacing: -2,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'PURE MINIMALISM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- LAYER 2: Top Shutter ---
          SlideTransition(
            position: _topSlide,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xFF111111), // Matte Black
              ),
            ),
          ),

          // --- LAYER 3: Bottom Shutter ---
          SlideTransition(
            position: _bottomSlide,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xFF111111), // Matte Black
              ),
            ),
          ),

          // --- LAYER 4: The Center Line (The Trigger) ---
          // This line sits exactly between the shutters
          Center(
            child: AnimatedBuilder(
              animation: _lineWidth,
              builder: (context, child) {
                // The line fades out when the shutters open
                double opacity = 1.0;
                if (_controller.value > 0.5) opacity = 0.0;

                return Opacity(
                  opacity: opacity,
                  child: Container(
                    height: 2, // Razor thin
                    width: _lineWidth.value,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- Placeholder Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Welcome Home",
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
  }
}
