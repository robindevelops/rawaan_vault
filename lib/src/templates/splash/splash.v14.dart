import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV14Screen extends StatefulWidget {
  const SplashV14Screen({super.key});

  @override
  State<SplashV14Screen> createState() => _SplashV14ScreenState();
}

class _SplashV14ScreenState extends State<SplashV14Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Sheet Animations
  late Animation<Offset> _sheet1Slide;
  late Animation<Offset> _sheet2Slide;
  late Animation<Offset> _sheet3Slide;

  // Content Animations
  late Animation<Offset> _contentSlide;
  late Animation<double> _contentFade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // 1. Darkest Shade (Base)
    _sheet1Slide = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );

    // 2. Lighter Shade (Accent)
    _sheet2Slide = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    // 3. Brand Color (Hero)
    _sheet3Slide = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    // 4. Content Slide
    _contentSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _contentFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8, curve: Curves.easeIn),
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
    final double screenHeight = MediaQuery.of(context).size.height;

    // --- COLOR PALETTE ---
    // 1. Darkest (Depth)
    const Color shade1 = Color(0xFF02381E);
    // 2. Light/Mint (Freshness)
    const Color shade2 = Color(0xFF69F0AE);
    // 3. Brand (Identity)
    const Color shade3 = Color(0xFF06C167);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ------------------------------------------------
          // LAYER 1: DEEP FOREST GREEN (The Foundation)
          // ------------------------------------------------
          SlideTransition(
            position: _sheet1Slide,
            child: Container(
              height: screenHeight,
              width: double.infinity,
              color: shade1,
            ),
          ),

          // ------------------------------------------------
          // LAYER 2: FRESH MINT GREEN (The Accent)
          // ------------------------------------------------
          SlideTransition(
            position: _sheet2Slide,
            child: Container(
              height: screenHeight,
              width: double.infinity,
              color: shade2,
            ),
          ),

          // ------------------------------------------------
          // LAYER 3: RAWAAN BRAND GREEN (The Reveal)
          // ------------------------------------------------
          SlideTransition(
            position: _sheet3Slide,
            child: Container(
              height: screenHeight,
              width: double.infinity,
              color: shade3, // The Final Brand Color
              child: Center(
                // ------------------------------------------------
                // THE LOGO LOCKUP
                // ------------------------------------------------
                child: FadeTransition(
                  opacity: _contentFade,
                  child: SlideTransition(
                    position: _contentSlide,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon Circle
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                )
                              ]),
                          child: Icon(
                            Icons.near_me_rounded,
                            size: 45,
                            color: shade3, // Icon matches background theme
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Text
                        Text(
                          "RAWAAN",
                          style: GoogleFonts.cairo(
                            fontSize: 34, // Slightly larger for impact
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.5,
                            height: 1.0,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Let's Go.",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
