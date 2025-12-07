import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV1Screen extends StatefulWidget {
  const SplashV1Screen({super.key});

  @override
  State<SplashV1Screen> createState() => _SplashV1ScreenState();
}

class _SplashV1ScreenState extends State<SplashV1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Separate animations for staggered effect
  late Animation<double> _uberFade;
  late Animation<Offset> _uberSlide;
  late Animation<double> _eatsFade;
  late Animation<Offset> _eatsSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 1800), // Slightly longer for the sequence
    );

    // 1. "Uber" Animation (Starts at 0%, ends at 60% of timeline)
    _uberFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _uberSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    // 2. "Eats" Animation (Starts at 30%, ends at 100% of timeline)
    // This overlap (30-60%) creates the smooth follow-up effect
    _eatsFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );
    _eatsSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _controller.forward();

    // Navigate after animation + short delay
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
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // "Uber" Part
            FadeTransition(
              opacity: _uberFade,
              child: SlideTransition(
                position: _uberSlide,
                child: Text(
                  "Uber",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.0,
                  ),
                ),
              ),
            ),

            // "Eats" Part
            FadeTransition(
              opacity: _eatsFade,
              child: SlideTransition(
                position: _eatsSlide,
                child: Text(
                  " Eats", // Leading space for separation
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF06C167), // Official Uber Eats Green
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Next Screen
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home Screen")));
  }
}
