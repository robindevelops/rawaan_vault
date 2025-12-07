import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV5Screen extends StatefulWidget {
  const SplashV5Screen({super.key});

  @override
  State<SplashV5Screen> createState() => _SplashV5ScreenState();
}

class _SplashV5ScreenState extends State<SplashV5Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animation variables
  late Animation<double> _lineWidthAnimation;
  late Animation<Offset> _textSlideUpAnimation;
  late Animation<Offset> _textSlideDownAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // 1. Line Expands Horizontally (Width)
    _lineWidthAnimation = Tween<double>(begin: 0.0, end: 180.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOutExpo),
      ),
    );

    // 2. Line Expands Vertically (Optional thickness change, staying thin here)
    // We just keep it solid, but we could animate height if we wanted.

    // 3. Title Slides UP from the line
    _textSlideUpAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0), // Starts "below" the visible area
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    // 4. Subtitle Slides DOWN from the line
    _textSlideDownAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0), // Starts "above" the visible area
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    // 5. Fade in (Just to smooth edges)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
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
    // Brand Colors
    const Color bgColor = Color(0xFFF5F5F7); // Soft Off-White (Premium)
    const Color brandGreen = Color(0xFF06C167);
    const Color textColor = Color(0xFF1A1A1A);

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // ------------------------------------------------
                // 1. THE LINE (The Anchor)
                // ------------------------------------------------
                Container(
                  width: _lineWidthAnimation.value,
                  height: 2, // Thin precision line
                  decoration: BoxDecoration(
                    color: brandGreen,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // ------------------------------------------------
                // 2. THE TITLE (Slides UP out of the line)
                // ------------------------------------------------
                Positioned(
                  bottom: 10, // Starts right at the line
                  child: ClipRect(
                    // ClipRect hides the text when it is "inside" the line
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: _opacityAnimation.value, // Growing reveal
                      child: SlideTransition(
                        position: _textSlideUpAnimation,
                        child: Text(
                          "RAWAAN",
                          style: GoogleFonts.dmSans(
                            color: textColor,
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1.5,
                            height: 1.0, // Tight line height
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ------------------------------------------------
                // 3. THE SUBTITLE (Slides DOWN out of the line)
                // ------------------------------------------------
                Positioned(
                  top: 12, // Starts right at the line
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: _opacityAnimation.value,
                      child: SlideTransition(
                        position: _textSlideDownAnimation,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "TRAVEL",
                              style: GoogleFonts.dmSans(
                                color: textColor.withOpacity(0.6),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3.0,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.arrow_forward,
                                size: 12, color: brandGreen)
                          ],
                        ),
                      ),
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
