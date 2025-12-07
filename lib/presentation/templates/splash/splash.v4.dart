import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV4Screen extends StatefulWidget {
  const SplashV4Screen({super.key});

  @override
  State<SplashV4Screen> createState() => _SplashV4ScreenState();
}

class _SplashV4ScreenState extends State<SplashV4Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _spacingAnimation;
  late Animation<double> _lineScaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Slow, cinematic duration
    );

    // 1. Blur Effect (Starts blurry, becomes sharp)
    _blurAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    // 2. Opacity (Fades in)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // 3. Letter Spacing (Drifts apart elegantly)
    _spacingAnimation = Tween<double>(begin: 2.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    // 4. Green Accent Line (Grows from center)
    _lineScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.9, curve: Curves.easeOutExpo),
      ),
    );

    _controller.forward();

    // Mock Navigation
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) debugPrint("Navigate Home");
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
      backgroundColor: Colors.black, // True Black for OLED/Slick look
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- THE BLUR & FOCUS TEXT ---
                // We wrap the text in a ImageFilter to blur it dynamically
                ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: _blurAnimation.value,
                    sigmaY: _blurAnimation.value,
                  ),
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: Text(
                      "RAWAAN",
                      style: GoogleFonts.manrope(
                        // Manrope is very geometric & clean
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300, // Light weight is slicker
                        letterSpacing: _spacingAnimation.value, // The drift
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // --- THE MINIMAL ACCENT LINE ---
                // A thin green line that draws itself
                Transform.scale(
                  scaleX: _lineScaleAnimation.value,
                  child: Container(
                    width: 40, // Small width
                    height: 2, // Very thin
                    color: const Color(0xFF06C167), // Brand Green
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
