import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV11Screen extends StatefulWidget {
  const SplashV11Screen({super.key});

  @override
  State<SplashV11Screen> createState() => _SplashV11ScreenState();
}

class _SplashV11ScreenState extends State<SplashV11Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _spreadAnimation;
  late Animation<double> _dotScaleAnimation;

  final String _text = "RAWAAN";
  // Determine how far apart letters should spread
  final double _letterSpacing = 45.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Fast 1 second
    );

    // 1. The Spread: Letters move from Center (0) to their Position (1)
    // Uses easeOutBack to give it a slight overshoot "snap"
    _spreadAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    // 2. The Dot: Appears right at the end with a pop
    _dotScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Slight delay before opening the "blade"
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });

    // Mock Nav
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) debugPrint("Navigating...");
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
      backgroundColor: const Color(0xFF111111), // Matte Black
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // 1. GENERATE LETTERS
                // We stack them all at the center initially.
                ...List.generate(_text.length, (index) {
                  // Calculate the final X position for this specific letter
                  // (index - middle) centers the whole word
                  double finalOffset =
                      (index - (_text.length - 1) / 2) * _letterSpacing;

                  return Transform.translate(
                    // Current Offset = Final Offset * Animation Value (0 to 1)
                    offset: Offset(finalOffset * _spreadAnimation.value, 0),
                    child: Text(
                      _text[index],
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                      ),
                    ),
                  );
                }),

                // 2. THE GREEN DOT (The Anchor)
                // It tracks the position of the last letter + some padding
                Transform.translate(
                  offset: Offset(
                      // Position: End of word + 25px padding.
                      // It moves with the spread so it looks attached to the 'N'.
                      (((_text.length - 1) / 2) * _letterSpacing + 25) *
                          _spreadAnimation.value,
                      12 // Push down slightly to align with baseline
                      ),
                  child: Transform.scale(
                    scale: _dotScaleAnimation.value,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF06C167), // Brand Green
                        shape: BoxShape.circle,
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
