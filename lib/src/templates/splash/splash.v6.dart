import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV6Screen extends StatefulWidget {
  const SplashV6Screen({super.key});

  @override
  State<SplashV6Screen> createState() => _SplashV6ScreenState();
}

class _SplashV6ScreenState extends State<SplashV6Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _shockwaveScaleAnimation;
  late Animation<double> _shockwaveOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // 1. Text Zoom (Massive to Normal)
    // Starts huge (scale 4.0) and lands at 1.0 quickly
    _scaleAnimation = Tween<double>(begin: 4.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve:
            const Interval(0.0, 0.5, curve: Curves.easeOutExpo), // "Slam" curve
      ),
    );

    // 2. Text Opacity (Fade in as it zooms)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    // 3. Shockwave Ring Expansion (Starts after text hits)
    _shockwaveScaleAnimation = Tween<double>(begin: 0.8, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    // 4. Shockwave Fade Out
    _shockwaveOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
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
    const Color brandColor = Color(0xFF06C167);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // 1. SHOCKWAVE RING (Behind text)
                // Only visible after the text lands (approx 0.4 progress)
                Opacity(
                  opacity: _shockwaveOpacityAnimation.value,
                  child: Transform.scale(
                    scale: _shockwaveScaleAnimation.value,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: brandColor.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                // 2. THE MAIN LOGO (Zooming In)
                Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon
                        const Icon(
                          Icons.near_me_rounded,
                          color: Colors.black,
                          size: 30,
                        ),

                        const SizedBox(height: 10),

                        // Text
                        Text(
                          "RAWAAN",
                          style: GoogleFonts.fjallaOne(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.0, // Tight & Solid
                            height: 1.0,
                          ),
                        ),
                        SizedBox(height: 5),

                        // Tagline (Static, attached to bottom)
                        Text(
                          "EST. 2025",
                          style: GoogleFonts.poppins(
                            color: brandColor, // Pop of color
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                          ),
                        ),
                      ],
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
