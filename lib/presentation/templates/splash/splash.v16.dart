import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class SplashV16Screen extends StatefulWidget {
  const SplashV16Screen({super.key});

  @override
  State<SplashV16Screen> createState() => _SplashV16ScreenState();
}

class _SplashV16ScreenState extends State<SplashV16Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animations
  late Animation<double> _iconScaleAnim;
  late Animation<double> _iconRotateAnim;
  late Animation<double> _textOpacityAnim;
  late Animation<double> _letterSpacingAnim;
  late Animation<double> _subtitleSlideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Slightly longer for elegance
    );

    // 1. Icon Scales Up with a slight bounce (Pop effect)
    _iconScaleAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    // 2. Icon Rotates (Like a compass finding North)
    _iconRotateAnim = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    // 3. Text Fades In
    _textOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    // 4. CREATIVE: Text Letters condense from wide to narrow
    _letterSpacingAnim = Tween<double>(begin: 10.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    // 5. Subtitle floats up softly
    _subtitleSlideAnim = Tween<double>(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOutQuad),
      ),
    );

    // Start
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });

    // Mock Nav
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) debugPrint("Navigate to Home");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Keeping your Blue/White palette
    const Color bgColor = const Color(0xFF06C167); // Official Uber Eats Green
    const Color white = Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ---------------------------------------------
                // 1. THE ICON (Rotating Compass)
                // ---------------------------------------------
                Transform.scale(
                  scale: _iconScaleAnim.value,
                  child: Transform.rotate(
                    angle: _iconRotateAnim.value * 2 * math.pi,
                    child: const Icon(
                      Icons.travel_explore, // or Icons.flight_takeoff
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // ---------------------------------------------
                // 2. THE TEXT (Cinematic Spacing)
                // ---------------------------------------------
                Opacity(
                  opacity: _textOpacityAnim.value,
                  child: Text(
                    "RAWAAN",
                    style: GoogleFonts.cairo(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: white,
                      // The creative magic happens here:
                      letterSpacing: _letterSpacingAnim.value,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // ---------------------------------------------
                // 3. THE SUBTITLE (Subtle Rise)
                // ---------------------------------------------
                Opacity(
                  opacity: _textOpacityAnim.value, // Reusing opacity
                  child: Transform.translate(
                    offset: Offset(0, _subtitleSlideAnim.value),
                    child: Text(
                      "LUXURY TRAVEL",
                      style: GoogleFonts.spaceMono(
                        fontSize: 12,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
