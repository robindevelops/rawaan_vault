import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV19Screen extends StatefulWidget {
  const SplashV19Screen({super.key});

  @override
  State<SplashV19Screen> createState() => _SplashV19ScreenState();
}

class _SplashV19ScreenState extends State<SplashV19Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animations
  late Animation<double> _heightAnim;
  late Animation<double> _widthAnim;
  late Animation<double> _opacityAnim;
  late Animation<double> _spacingAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // 1. Line draws Vertically (Height grows)
    _heightAnim = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutExpo),
      ),
    );

    // 2. Line opens Horizontally (Width grows)
    _widthAnim = Tween<double>(begin: 2.0, end: 280.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOutQuart),
      ),
    );

    // 3. Content Fades In (As box opens)
    _opacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.6, curve: Curves.easeIn),
      ),
    );

    // 4. Letter Spacing (Drifts from tight to elegant)
    _spacingAnim = Tween<double>(begin: 0.0, end: 3.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
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
    // --- PALETTE: LUXURY GOLD ---
    const Color bg = Color(0xFF0D0D0D); // Deep Matte Black
    const Color gold = Color(0xFFD4AF37); // Metallic Gold
    const Color white = Colors.white;

    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              // The container expands from a line to a box
              height: _heightAnim.value,
              width: _widthAnim.value,
              decoration: BoxDecoration(
                // Only show border when opening, makes it look like the "Gate"
                border: Border(
                  left: BorderSide(
                      color: gold.withOpacity(1.0 - _opacityAnim.value),
                      width: 2),
                  right: BorderSide(
                      color: gold.withOpacity(1.0 - _opacityAnim.value),
                      width: 2),
                ),
              ),
              child: FadeTransition(
                opacity: _opacityAnim,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon
                    Icon(
                      Icons.access_alarm_sharp,
                      color: gold,
                      size: 40,
                    ),

                    const SizedBox(width: 15),

                    // Text Lockup
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RAWAAN",
                          style: GoogleFonts.tenorSans(
                            // High-Fashion Font
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: white,
                            letterSpacing:
                                _spacingAnim.value, // Dynamic Spacing
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "PREMIUM RIDES",
                          style: GoogleFonts.dmSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: gold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
