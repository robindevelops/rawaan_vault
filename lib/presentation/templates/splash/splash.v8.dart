import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV8Screen extends StatefulWidget {
  const SplashV8Screen({super.key});

  @override
  State<SplashV8Screen> createState() => _SplashV8ScreenState();
}

class _SplashV8ScreenState extends State<SplashV8Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _spacingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Slow & Smooth (2.5s)
    );

    // 1. Blur: Starts at 10px blur, ends at 0px (Sharp)
    _blurAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    // 2. Opacity: Soft fade in
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInQuad),
      ),
    );

    // 3. Slide: Gentle rise from bottom (Offset 0.2 -> 0.0)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart, // Very smooth ending
      ),
    );

    // 4. Spacing: Letters drift closer together (Tracking)
    // Starts at 8.0 spacing, settles at 2.0
    _spacingAnimation = Tween<double>(begin: 8.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();

    // Mock Nav
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) debugPrint("Home");
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
      backgroundColor: const Color(0xFF111111), // Soft Matte Black
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimation,
              child: ImageFiltered(
                // The Cinematic Blur Effect
                imageFilter: ImageFilter.blur(
                  sigmaX: _blurAnimation.value,
                  sigmaY: _blurAnimation.value,
                ),
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Minimalist Logo Icon
                      const Icon(
                        Icons
                            .trip_origin, // Abstract circle/dot is very minimal
                        color: Colors.white,
                        size: 18,
                      ),

                      const SizedBox(height: 20),

                      // Typography
                      Text(
                        "RAWAAN",
                        style: GoogleFonts.laila(
                          // Manrope is clean & geometric
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w500, // Light weight = Elegant
                          letterSpacing: _spacingAnimation.value,
                        ),
                      ),
                    ],
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
