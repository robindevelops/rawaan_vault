import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV30Screen extends StatefulWidget {
  const SplashV30Screen({super.key});

  @override
  State<SplashV30Screen> createState() => _SplashV30ScreenState();
}

class _SplashV30ScreenState extends State<SplashV30Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Diagonal Slide Animations for the 4 Corners
  late Animation<Offset> _topLeftSlide;
  late Animation<Offset> _topRightSlide;
  late Animation<Offset> _bottomLeftSlide;
  late Animation<Offset> _bottomRightSlide;

  // Text Reveal Animation
  late Animation<double> _textOpacity;
  late Animation<double> _textSpread;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // Common Curve for the "Mechanical Slide" feel
    const Curve slideCurve = Interval(0.3, 1.0, curve: Curves.easeInOutQuart);

    // 1. Define Directions (Outward Explosion)
    _topLeftSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, -1.0))
            .animate(
      CurvedAnimation(parent: _controller, curve: slideCurve),
    );

    _topRightSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, -1.0)).animate(
      CurvedAnimation(parent: _controller, curve: slideCurve),
    );

    _bottomLeftSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 1.0)).animate(
      CurvedAnimation(parent: _controller, curve: slideCurve),
    );

    _bottomRightSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, 1.0)).animate(
      CurvedAnimation(parent: _controller, curve: slideCurve),
    );

    // 2. Text Animations (Subtle reveal)
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.5, 0.8, curve: Curves.easeIn)),
    );

    _textSpread = Tween<double>(begin: -10.0, end: 2.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic)),
    );

    // Start
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.forward();
    });

    // Navigate Away
    Timer(const Duration(milliseconds: 2800), () {
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
    // The "Cover" Color
    const Color coverColor = Color(0xFF000000); // Pitch Black

    return Scaffold(
      backgroundColor: Colors.white, // The Reveal Color
      body: Stack(
        children: [
          // --- LAYER 1: The Content (Underneath) ---
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _textOpacity.value,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Rawaan',
                        style: GoogleFonts.cairo(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: _textSpread.value, // Dynamic Spacing
                          height: 1.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 60,
                        height: 4,
                        color: Colors.black, // Minimal divider
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          // --- LAYER 2: The Quadrants (The Cover) ---
          Column(
            children: [
              // TOP HALF
              Expanded(
                child: Row(
                  children: [
                    // Top-Left Quadrant
                    Expanded(
                      child: SlideTransition(
                        position: _topLeftSlide,
                        child: Container(color: coverColor),
                      ),
                    ),
                    // Top-Right Quadrant
                    Expanded(
                      child: SlideTransition(
                        position: _topRightSlide,
                        child: Container(color: coverColor),
                      ),
                    ),
                  ],
                ),
              ),
              // BOTTOM HALF
              Expanded(
                child: Row(
                  children: [
                    // Bottom-Left Quadrant
                    Expanded(
                      child: SlideTransition(
                        position: _bottomLeftSlide,
                        child: Container(color: coverColor),
                      ),
                    ),
                    // Bottom-Right Quadrant
                    Expanded(
                      child: SlideTransition(
                        position: _bottomRightSlide,
                        child: Container(color: coverColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
      body: Center(child: Text("v30 ONLINE")),
    );
  }
}
