import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV10Screen extends StatefulWidget {
  const SplashV10Screen({super.key});

  @override
  State<SplashV10Screen> createState() => _SplashV10ScreenState();
}

class _SplashV10ScreenState extends State<SplashV10Screen> {
  final String _targetText = "RAWAAN";
  String _currentText = "";

  bool _showCursor = true;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _runTypingAnimation();
    _runCursorBlink();

    // Mock Nav
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) debugPrint("Navigating...");
    });
  }

  // 1. Typewriter Logic
  void _runTypingAnimation() async {
    // Wait before starting (Boot up feel)
    await Future.delayed(const Duration(milliseconds: 600));

    for (int i = 0; i < _targetText.length; i++) {
      if (!mounted) return;
      // Irregular typing speed feels more natural/mechanical
      await Future.delayed(const Duration(milliseconds: 150));

      setState(() {
        _currentText = _targetText.substring(0, i + 1);
      });
    }

    setState(() => _isFinished = true);
  }

  // 2. Blinking Cursor Logic
  void _runCursorBlink() {
    Future.doWhile(() async {
      if (!mounted) return false;
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => _showCursor = !_showCursor);
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Minimal & Slick Palette
    const Color bgColor =
        Color(0xFF1A1A1A); // Matte Charcoal (Softer than black)
    const Color textColor = Colors.white;
    const Color cursorColor = Color(0xFF06C167); // Brand Green

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- THE TYPEWRITER ROW ---
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _currentText,
                  style: GoogleFonts.spaceMono(
                    color: textColor,
                    fontSize: 46,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -2.0, // Tighter for a logo feel
                  ),
                ),

                // --- THE GLOWING CURSOR ---
                AnimatedOpacity(
                  opacity: _showCursor ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 100), // Snap blink
                  child: Container(
                    width: 12, // Slick block cursor
                    height: 46,
                    margin: const EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                      color: cursorColor,
                      boxShadow: [
                        BoxShadow(
                          color: cursorColor.withOpacity(0.5),
                          blurRadius: 15, // The Glow
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),

            // --- SUBTITLE (System Status) ---
            AnimatedOpacity(
              opacity: _isFinished ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 800),
              child: Text(
                "SYSTEM ONLINE",
                style: GoogleFonts.spaceMono(
                  color: Colors.grey[600],
                  fontSize: 10,
                  letterSpacing: 4.0, // Wide spacing for tech look
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
