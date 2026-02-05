import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV20Screen extends StatefulWidget {
  const SplashV20Screen({super.key});

  @override
  State<SplashV20Screen> createState() => _SplashV20ScreenState();
}

class _SplashV20ScreenState extends State<SplashV20Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _iconSlide;
  late Animation<double> _iconScale;
  late Animation<Offset> _textSlide;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // 1. Icon Rises (From slightly below)
    _iconSlide = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutQuart),
      ),
    );

    // 2. Icon Scales Up (Adds "looming" depth)
    _iconScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    // 3. Text Rises (Delayed slightly)
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    // 4. Text Fade In
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeIn),
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
    // --- PALETTE ---
    const Color bg = Color(0xFF000000); // Void Black
    const Color accent = Color(0xFFCCFF00); // Acid Green
    const Color white = Colors.white;

    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ------------------------------------------------
            // 1. THE ICON (Masked Rise)
            // ------------------------------------------------
            ClipRect(
              child: SizedBox(
                width: 80,
                height: 80,
                child: SlideTransition(
                  position: _iconSlide,
                  child: ScaleTransition(
                    scale: _iconScale,
                    child: Container(
                      decoration: BoxDecoration(
                        color: accent, // Acid Green
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.near_me_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // 2. THE TEXT (Masked Rise)
            // ------------------------------------------------
            ClipRect(
              child: SizedBox(
                height: 60, // Restrict height for the "emerging" effect
                child: FadeTransition(
                  opacity: _textOpacity,
                  child: SlideTransition(
                    position: _textSlide,
                    child: Column(
                      children: [
                        Text(
                          "RAWAAN",
                          style: GoogleFonts.cairo(
                            // Cool Art Font
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: white,
                            letterSpacing: 1.0,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          "EST. 2025",
                          style: GoogleFonts.syne(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
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
