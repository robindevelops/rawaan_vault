import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV12Screen extends StatefulWidget {
  const SplashV12Screen({super.key});

  @override
  State<SplashV12Screen> createState() => _SplashV12ScreenState();
}

class _SplashV12ScreenState extends State<SplashV12Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _wipeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Smooth 1.5s
    );

    // Animates height factor from 0.0 (Empty) to 1.0 (Full Screen)
    _wipeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic, // Starts slow, speeds up, slows down
      ),
    );

    // Slight delay before the wipe starts
    Future.delayed(const Duration(milliseconds: 500), () {
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
    // 1. Define the Two Themes (Before & After)

    // Theme A: Dark Mode (Start)
    const Color bgA = Color(0xFF111111);
    const Color textA = Colors.white;

    // Theme B: Brand Mode (End)
    const Color bgB = Color(0xFF06C167); // Brand Green
    const Color textB = Color(0xFF111111); // Dark Text on Green

    return Scaffold(
      body: Stack(
        children: [
          // -----------------------------------------------------------
          // LAYER 1: THE BOTTOM LAYER (Dark Background)
          // -----------------------------------------------------------
          Container(
            color: bgA,
            child: Center(
              child: _buildLogoText(textA),
            ),
          ),

          // -----------------------------------------------------------
          // LAYER 2: THE WIPE LAYER (Green Background)
          // -----------------------------------------------------------
          // We mask this layer. As heightFactor grows, it covers Layer 1.
          AnimatedBuilder(
            animation: _wipeAnimation,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter, // Wipes UP from bottom
                  heightFactor: _wipeAnimation.value,
                  child: Container(
                    color: bgB,
                    child: Center(
                      // The text here MUST be perfectly aligned with Layer 1
                      // but with the inverted color.
                      child: _buildLogoText(textB),
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

  // Shared Widget to ensure pixel-perfect alignment between layers
  Widget _buildLogoText(Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.near_me_rounded, size: 60, color: color),
        const SizedBox(height: 15),
        Text(
          "RAWAAN",
          style: GoogleFonts.dmSans(
            fontSize: 50,
            fontWeight: FontWeight.w900, // Thick bold looks best for masking
            color: color,
            letterSpacing: -1.0,
          ),
        ),
      ],
    );
  }
}
