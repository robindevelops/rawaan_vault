import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV13Screen extends StatefulWidget {
  const SplashV13Screen({super.key});

  @override
  State<SplashV13Screen> createState() => _SplashV13ScreenState();
}

class _SplashV13ScreenState extends State<SplashV13Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _leftPartSlide;
  late Animation<Offset> _rightPartSlide;
  late Animation<Color?> _flashAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      // Fast duration for high energy
      duration: const Duration(milliseconds: 1200),
    );

    // 1. Define the impact moment (e.g., at 70% of the animation)
    const double impactPoint = 0.7;

    // 2. Left part slides in from left to center
    // easeInExpo creates that heavy acceleration look
    _leftPartSlide = Tween<Offset>(
      begin: const Offset(-2.0, 0.0), // Starts way off-screen left
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, impactPoint, curve: Curves.easeInExpo),
      ),
    );

    // 3. Right part slides in from right to center
    _rightPartSlide = Tween<Offset>(
      begin: const Offset(2.0, 0.0), // Starts way off-screen right
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, impactPoint, curve: Curves.easeInExpo),
      ),
    );

    // 4. The Impact Flash
    // The background turns white instantly at the impact point, then fades back to black.
    _flashAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        // Stay black until impact
        tween: ColorTween(
            begin: const Color(0xFF000000), end: const Color(0xFF000000)),
        weight: impactPoint * 100,
      ),
      TweenSequenceItem(
        // INSTANT white flash at impact, then quickly fade back to black
        tween: ColorTween(begin: Colors.white, end: const Color(0xFF000000)),
        weight: (1.0 - impactPoint) * 100,
      ),
    ]).animate(_controller);

    // Slight delay before launch
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
    const Color brandColor = Color(0xFF06C167);

    // We use AnimatedBuilder to animate the background color flash
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _flashAnimation.value,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Align items to the center so they meet perfectly
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- LEFT PART (ICON) ---
                SlideTransition(
                  position: _leftPartSlide,
                  child: const Icon(
                    FontAwesomeIcons.accusoft,
                    size: 50,
                    color: brandColor,
                  ),
                ),

                const SizedBox(width: 25), // Space between them at rest

                // --- RIGHT PART (TEXT) ---
                SlideTransition(
                  position: _rightPartSlide,
                  child: Text(
                    "RAWAAN",
                    style: GoogleFonts.aDLaMDisplay(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
