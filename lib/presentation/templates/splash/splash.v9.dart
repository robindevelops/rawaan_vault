import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV9Screen extends StatefulWidget {
  const SplashV9Screen({super.key});

  @override
  State<SplashV9Screen> createState() => _SplashV9ScreenState();
}

class _SplashV9ScreenState extends State<SplashV9Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animations
  late Animation<Offset> _textSlideAnimation;
  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<double> _lineScaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800), // Quick & snappy (1.8s)
    );

    // 1. Title Slides UP (From invisible to visible)
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0), // Starts 100% below its box
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutQuart),
      ),
    );

    // 2. Subtitle Slides UP (Delayed slightly)
    _subtitleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.9, curve: Curves.easeOutQuart),
      ),
    );

    // 3. Line Expands (Width)
    _lineScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutExpo),
      ),
    );

    // 4. Subtle Fade (To smooth the edges)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
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
    // A very clean, dark grey background for slickness
    const Color bg = Color(0xFFF5F5F7);
    const Color text = Color(0xFF111111);
    const Color accent = Color(0xFF06C167);

    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- 1. THE MAIN TITLE (MASKED) ---
            ClipRect(
              // ClipRect cuts off anything outside this box
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _textSlideAnimation,
                  child: Text(
                    "RAWAAN",
                    style: GoogleFonts.dmSans(
                      // Geometric & Clean
                      color: text,
                      fontSize: 56,
                      fontWeight: FontWeight.w900, // Extra Bold
                      letterSpacing: -2.0, // Tight spacing = Modern
                      height: 1.0, // Removes extra padding
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // --- 2. THE DIVIDER LINE ---
            AnimatedBuilder(
              animation: _lineScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scaleX: _lineScaleAnimation.value,
                  child: Container(
                    width: 60, // Short, minimal line
                    height: 4,
                    color: accent, // The only pop of color
                  ),
                );
              },
            ),

            const SizedBox(height: 10),

            // --- 3. THE SUBTITLE (MASKED) ---
            ClipRect(
              child: SlideTransition(
                position: _subtitleSlideAnimation,
                child: Text(
                  "Journey Elevated",
                  style: GoogleFonts.dmSans(
                    color: text.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0, // Wide spacing for contrast
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
