import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV17Screen extends StatefulWidget {
  const SplashV17Screen({super.key});

  @override
  State<SplashV17Screen> createState() => _SplashV17ScreenState();
}

class _SplashV17ScreenState extends State<SplashV17Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animations
  late Animation<double> _radiusAnimation;
  late Animation<double> _contentScaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // 1. The Expanding Circle (The Mask)
    // Expands from 0 to 1.5x screen height to cover corners
    _radiusAnimation = Tween<double>(begin: 0.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        // Expo curve gives it a slow start, fast middle, slow end (Premium feel)
        curve: Curves.easeInOutExpo,
      ),
    );

    // 2. Subtle Content Scale (The Pop)
    // The text shrinks slightly as the circle expands, adding depth
    _contentScaleAnimation = Tween<double>(begin: 1.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart,
      ),
    );

    // Slight delay before the pulse
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });

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
    // --- PALETTE ---
    const Color color2 = Colors.white;
    const Color color1 = Colors.black;

    return Scaffold(
      body: Stack(
        children: [
          // ------------------------------------------------------
          // LAYER 1: THE BASE (White Background, Navy Text)
          // ------------------------------------------------------
          Container(
            color: color1,
            child: Center(
              child: _buildContent(color2), // Navy Content
            ),
          ),

          // ------------------------------------------------------
          // LAYER 2: THE REVEAL (Navy Background, White Text)
          // ------------------------------------------------------
          // This layer sits on top but is clipped by a growing circle.
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ClipPath(
                clipper: _CircleRevealClipper(_radiusAnimation.value),
                child: Container(
                  color: color2, // Navy Background
                  child: Center(
                    child: _buildContent(color1), // White Content
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper to ensure both layers align perfectly
  Widget _buildContent(Color color) {
    return ScaleTransition(
      scale: _contentScaleAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.near_me_rounded,
            size: 50,
            color: color,
          ),
          const SizedBox(height: 10),
          Text(
            "RAWAAN",
            style: GoogleFonts.cairo(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: color,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "NAVIGATE YOUR WORLD",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: color.withOpacity(0.7),
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// CUSTOM CLIPPER (The Math behind the Circle)
// ------------------------------------------------------
class _CircleRevealClipper extends CustomClipper<Path> {
  final double value;

  _CircleRevealClipper(this.value);

  @override
  Path getClip(Size size) {
    final Path path = Path();
    // Calculate center of screen
    final Offset center = Offset(size.width / 2, size.height / 2);
    // Calculate radius based on animation value * screen height
    final double radius = size.height * value;

    // Draw the circle
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
