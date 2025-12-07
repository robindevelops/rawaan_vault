import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV18Screen extends StatefulWidget {
  const SplashV18Screen({super.key});

  @override
  State<SplashV18Screen> createState() => _SplashV18ScreenState();
}

class _SplashV18ScreenState extends State<SplashV18Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animations
  late Animation<double> _lineDrawAnim;
  late Animation<Offset> _topPanelSlide;
  late Animation<Offset> _bottomPanelSlide;
  late Animation<double> _contentScaleAnim;
  late Animation<double> _contentFadeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // 1. The Horizon Line Draws (Left to Right)
    _lineDrawAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeInOutExpo),
      ),
    );

    // 2. Top Panel Slides Up
    _topPanelSlide = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutExpo),
      ),
    );

    // 3. Bottom Panel Slides Down
    _bottomPanelSlide = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutExpo),
      ),
    );

    // 4. Content Scales (Zoom out slightly for depth)
    _contentScaleAnim = Tween<double>(begin: 1.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutQuart),
      ),
    );

    // 5. Content Fade (Just to ensure clean reveal)
    _contentFadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeIn),
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
    // Colors
    const Color coverColor = Color(0xFF111111); // The "Doors" (Matte Black)
    const Color revealBg = Colors.white; // The Inside (Clean White)
    const Color accentColor = Colors.white;
    const Color textColor = Color(0xFF0D0D0D);

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: revealBg, // The background BEHIND the doors
      body: Stack(
        children: [
          // ------------------------------------------------
          // LAYER 1: THE REVEALED CONTENT (Background)
          // ------------------------------------------------
          Center(
            child: ScaleTransition(
              scale: _contentScaleAnim,
              child: FadeTransition(
                opacity: _contentFadeAnim,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "RAWAAN",
                      style: GoogleFonts.spaceGrotesk(
                        // Modern Tech Font
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        letterSpacing: -1.5,
                      ),
                    ),
                    Text(
                      "JOURNEY STARTED",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ------------------------------------------------
          // LAYER 2: THE TOP DOOR
          // ------------------------------------------------
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height / 2, // Takes up top half
            child: SlideTransition(
              position: _topPanelSlide,
              child: Container(
                color: coverColor,
                alignment:
                    Alignment.bottomCenter, // Align content to the split line
                child: Container(
                  height: 2,
                  width: double.infinity,
                  // The Horizon Line (Top Half)
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          // ------------------------------------------------
          // LAYER 3: THE BOTTOM DOOR
          // ------------------------------------------------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: size.height / 2, // Takes up bottom half
            child: SlideTransition(
              position: _bottomPanelSlide,
              child: Container(
                color: coverColor,
                alignment:
                    Alignment.topCenter, // Align content to the split line
                child: AnimatedBuilder(
                  animation: _lineDrawAnim,
                  builder: (context, child) {
                    return Container(
                      height: 2, // The Horizon Line Thickness
                      width: size.width * _lineDrawAnim.value, // Expands
                      color: accentColor, // The glowing line color
                      alignment: Alignment.center,
                      // boxShadow: [
                      //    BoxShadow(
                      //      color: accentColor.withOpacity(0.8),
                      //      blurRadius: 10,
                      //      spreadRadius: 1,
                      //    )
                      // ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
