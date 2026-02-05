import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SplashV25Screen extends StatefulWidget {
  const SplashV25Screen({super.key});

  @override
  State<SplashV25Screen> createState() => _SplashV25ScreenState();
}

class _SplashV25ScreenState extends State<SplashV25Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Setup Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // 2. Define Animations

    // Scale: Slight zoom out for a "settling" effect
    _scaleAnimation = Tween<double>(begin: 1.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    // Opacity: Fade in smoothly
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.4, curve: Curves.easeIn)),
    );

    // Shimmer: Moves the gradient stops across the text
    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 1.0, curve: Curves.easeInOut)),
    );

    // 3. Start Animation
    _controller.forward();

    // 4. Navigate after animation finishes
    Timer(
      const Duration(milliseconds: 3000),
      () {
        // Navigator.of(context).pushReplacement(
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation, secondaryAnimation) =>
        //         const HomeScreen(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       return FadeTransition(opacity: animation, child: child);
        //     },
        //     transitionDuration: const Duration(milliseconds: 800),
        //   ),
        // );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505), // Deep, near-black background
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) {
                    // This creates the "Light Beam" effect
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: const [
                        Color(0xFF333333), // Dark Grey
                        Color(0xFFFFFFFF), // White (The Shine)
                        Color(0xFF333333), // Dark Grey
                      ],
                      stops: [
                        _shimmerAnimation.value - 0.4,
                        _shimmerAnimation.value,
                        _shimmerAnimation.value + 0.4,
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Rawaan'.toUpperCase(),
                    style: GoogleFonts.cairo(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// --- Placeholder Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Welcome to v25",
          style: TextStyle(color: Colors.grey[800], fontSize: 24),
        ),
      ),
    );
  }
}
