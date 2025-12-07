import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV7Screen extends StatefulWidget {
  const SplashV7Screen({super.key});

  @override
  State<SplashV7Screen> createState() => _SplashV7ScreenState();
}

class _SplashV7ScreenState extends State<SplashV7Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // We don't need separate variables for every letter.
  // We will generate them dynamically in the build method using Intervals.
  late Animation<double> _lineScaleAnimation;

  final String _title = "RAWAAN";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Time for the whole wave
    );

    // Line expands at the very end (from 70% to 100% of the timeline)
    _lineScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOutExpo),
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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. THE STAGGERED TEXT ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_title.length, (index) {
                return _buildAnimatedLetter(index);
              }),
            ),

            const SizedBox(height: 15),

            // 2. THE EXPANDING LINE
            AnimatedBuilder(
              animation: _lineScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scaleX: _lineScaleAnimation.value,
                  child: Container(
                    width: 120,
                    height: 4,
                    decoration: BoxDecoration(
                        color: const Color(0xFF06C167), // Brand Green
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF06C167).withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 2))
                        ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build each letter with a unique delay
  Widget _buildAnimatedLetter(int index) {
    // Calculate start/end times for this specific letter
    // Each letter waits 0.1s longer than the previous one
    final double startTime = (index * 0.1);
    final double endTime = startTime + 0.4; // Animation takes 0.4s per letter

    // Safety check to ensure intervals don't exceed 1.0
    // (In a real app, you might map this more precisely)
    final safeStart = startTime.clamp(0.0, 1.0);
    final safeEnd = endTime.clamp(0.0, 1.0);

    final Animation<Offset> slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.5), // Slide from slightly below
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(safeStart, safeEnd, curve: Curves.easeOutBack),
      ),
    );

    final Animation<double> fadeAnim =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(safeStart, safeEnd, curve: Curves.easeIn),
      ),
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: fadeAnim,
          child: SlideTransition(
            position: slideAnim,
            child: Text(
              _title[index],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                letterSpacing: 4.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
