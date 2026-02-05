import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV3Screen extends StatefulWidget {
  const SplashV3Screen({super.key});

  @override
  State<SplashV3Screen> createState() => _SplashV3ScreenState();
}

class _SplashV3ScreenState extends State<SplashV3Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Separate animations for independent control
  late Animation<double> _iconScaleAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<double> _subtitleFadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 2000), // Slightly longer for the sequence
    );

    // 1. Icon Pop (Starts immediately, Bouncy)
    _iconScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        // The Interval means it happens during the first 60% of the time
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    // 2. Title Slide Up (Starts a bit later at 30%)
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8,
            curve: Curves.easeOutBack), // Slight overshoot
      ),
    );

    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
      ),
    );

    // 3. Subtitle Fade (Starts last at 70%)
    _subtitleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    // Mock Navigation
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) debugPrint("Navigate home");
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
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- ICON ANIMATION ---
            ScaleTransition(
              scale: _iconScaleAnimation,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black, // Icon background
                ),
                child: const Icon(
                  Icons.local_taxi,
                  size: 30,
                  color: Colors.amber, // Icon color inverted
                ),
              ),
            ),

            const SizedBox(height: 10),

            // --- TITLE ANIMATION ---
            FadeTransition(
              opacity: _textFadeAnimation,
              child: SlideTransition(
                position: _textSlideAnimation,
                child: Text(
                  "Rawaan",
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800, // Extra bold
                    letterSpacing: -1.0, // Tighter for modern look
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // --- SUBTITLE ANIMATION ---
            FadeTransition(
              opacity: _subtitleFadeAnimation,
              child: Text(
                "EST. 2025",
                style: GoogleFonts.calistoga(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 12,
                  letterSpacing: 2.0, // Wide spacing for elegance
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
