import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome V13 - Mood Diary Desert Theme
/// Illustrated desert background with pyramids, warm color palette
class WelcomeV13Screen extends StatefulWidget {
  const WelcomeV13Screen({super.key});
  @override
  State<WelcomeV13Screen> createState() => _WelcomeV13ScreenState();
}

class _WelcomeV13ScreenState extends State<WelcomeV13Screen> {
  // Desert Theme Colors
  static const Color _skyTop = Color(0xFF4A7C6F);
  static const Color _skyBottom = Color(0xFF8FB8A8);
  static const Color _sand = Color(0xFFD4A574);
  static const Color _sandDark = Color(0xFFC49660);
  static const Color _orange = Color(0xFFF7A24B);
  static const Color _cream = Color(0xFFF5E6C8);
  static const Color _brown = Color(0xFF6B4226);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_skyTop, _skyBottom, _sand, _sandDark],
              stops: [0.0, 0.35, 0.6, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Stars decoration at top
              Positioned(
                top: 60,
                left: 30,
                child: _buildStar(4),
              ),
              Positioned(
                top: 80,
                right: 60,
                child: _buildStar(3),
              ),
              Positioned(
                top: 120,
                left: 100,
                child: _buildStar(2),
              ),
              Positioned(
                top: 100,
                right: 120,
                child: _buildStar(3),
              ),

              // Main Content
              SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Speech bubble with "desert"
                    _buildSpeechBubble(),
                    const SizedBox(height: 12),
                    // Main Title
                    Text(
                      'MOOD',
                      style: GoogleFonts.boogaloo(
                        fontSize: 72,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 0.9,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'DIARY',
                      style: GoogleFonts.boogaloo(
                        fontSize: 72,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 0.9,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Illustration area (pyramids silhouette)
                    _buildDesertIllustration(),
                    const SizedBox(height: 40),
                    // Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          _buildButton('SIGN IN'),
                          const SizedBox(height: 16),
                          _buildButton('SIGN UP'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStar(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSpeechBubble() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: _orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.eco, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            'desert',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesertIllustration() {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Pyramids
          Positioned(
            bottom: 20,
            left: 60,
            child: CustomPaint(
              size: const Size(100, 80),
              painter: PyramidPainter(color: _sandDark),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 40,
            child: CustomPaint(
              size: const Size(120, 100),
              painter: PyramidPainter(color: _sand),
            ),
          ),
          // Palm tree left
          Positioned(
            bottom: 0,
            left: 20,
            child: _buildPalmTree(),
          ),
          // Palm tree right
          Positioned(
            bottom: 0,
            right: 80,
            child: _buildPalmTree(),
          ),
          // Cactus
          Positioned(
            bottom: 10,
            right: 30,
            child: Icon(Icons.park, color: Color(0xFF4A6B3C), size: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildPalmTree() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.park, color: Color(0xFF3D6B4A), size: 50),
        Container(
          width: 8,
          height: 30,
          decoration: BoxDecoration(
            color: _brown,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        color: _cream,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _brown.withOpacity(0.6), width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _brown,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

// Custom painter for pyramid shapes
class PyramidPainter extends CustomPainter {
  final Color color;
  PyramidPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
