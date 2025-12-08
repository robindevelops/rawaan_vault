import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class V28CinematicSplash extends StatefulWidget {
  const V28CinematicSplash({super.key});

  @override
  State<V28CinematicSplash> createState() => _V28CinematicSplashState();
}

class _V28CinematicSplashState extends State<V28CinematicSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _spacingAnimation;
  late Animation<double> _blurAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // Smoothly converge letters (less harsh than before)
    _spacingAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic, // Very smooth
      ),
    );

    // Smooth blur → clarity
    _blurAnimation = Tween<double>(begin: 18.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.9, curve: Curves.easeOut),
      ),
    );

    // Gentle fade-in
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.45, curve: Curves.easeInOut),
      ),
    );

    // Subtle cinematic zoom (not tied to blur anymore for smoothness)
    _scaleAnimation = Tween<double>(begin: 1.08, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutExpo, // buttery smooth
      ),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.forward();
    });

    Timer(const Duration(milliseconds: 2600), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
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
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: _blurAnimation.value,
                sigmaY: _blurAnimation.value,
              ),
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Text(
                    'Rawaan',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: _spacingAnimation.value,
                    ),
                    textAlign: TextAlign.center,
                    // Smoothed spacing animation
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("v28 IS READY", style: TextStyle(letterSpacing: 2)),
      ),
    );
  }
}
