import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV2Screen extends StatefulWidget {
  const SplashV2Screen({super.key});

  @override
  State<SplashV2Screen> createState() => _SplashV2ScreenState();
}

class _SplashV2ScreenState extends State<SplashV2Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Quick, snappy duration
    );

    // 1. Elastic Scale (The Bounce)
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        // elasticOut creates the "boing" effect at the end
        curve: Curves.elasticOut,
      ),
    );

    // 2. Fade (To smooth the start)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    // Navigate logic
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NextScreen()),
        );
      }
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
      backgroundColor: const Color(0xFF06C167),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon (Optional, adds to the pop effect)
                // 1. Icon with "Motion" rotation and shadow

                // 2. Text with Depth
                Text(
                  "RAWAAN",
                  style: GoogleFonts.fjallaOne(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.8,
                  ),
                ),

                // 3. Subtitle (Optional, completes the lockup)
                Text(
                  "Travel Freely",
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home")));
  }
}
