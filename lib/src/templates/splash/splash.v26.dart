import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV26Screen extends StatefulWidget {
  const SplashV26Screen({super.key});

  @override
  State<SplashV26Screen> createState() => _SplashV26ScreenState();
}

class _SplashV26ScreenState extends State<SplashV26Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _textScaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2, milliseconds: 500),
    );

    // Expands the circle from 0 to much larger than the screen
    _sizeAnimation = Tween<double>(begin: 0.0, end: 1500.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo),
    );

    // Subtle text zoom for dynamism
    _textScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start animation
    _controller.forward();

    // Navigate away
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
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
      backgroundColor: Colors.black, // Base layer background
      body: Stack(
        children: [
          // --- LAYER 1: Dark Mode (The "Before" State) ---
          Center(
            child: ScaleTransition(
              scale: _textScaleAnimation,
              child: Text(
                'Welcome to',
                style: GoogleFonts.fjallaOne(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white, // White text on Black background
                  letterSpacing: -1,
                ),
              ),
            ),
          ),

          // --- LAYER 2: Light Mode (The "Reveal" State) ---
          // We clip this layer so it expands outward
          AnimatedBuilder(
            animation: _sizeAnimation,
            builder: (context, child) {
              return ClipOval(
                clipper: CircleRevealClipper(_sizeAnimation.value),
                child: Container(
                  color: Colors.white, // Top layer background
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: ScaleTransition(
                      scale: _textScaleAnimation,
                      child: const Text(
                        'Rawaan',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: Colors.black, // Black text on White background
                          letterSpacing: -4,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// --- Custom Clipper for the expanding circle ---
class CircleRevealClipper extends CustomClipper<Rect> {
  final double radius;

  CircleRevealClipper(this.radius);

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
  }

  @override
  bool shouldReclip(CircleRevealClipper oldClipper) {
    return oldClipper.radius != radius;
  }
}

// --- Placeholder Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(child: Text("We are live.")),
    );
  }
}
