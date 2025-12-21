import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome V13 - Mood Diary Desert Theme (Enhanced)
/// Beautiful desert sunset with animated pyramids, floating stars,
/// and premium glassmorphic buttons
class WelcomeV13Screen extends StatefulWidget {
  const WelcomeV13Screen({super.key});
  @override
  State<WelcomeV13Screen> createState() => _WelcomeV13ScreenState();
}

class _WelcomeV13ScreenState extends State<WelcomeV13Screen>
    with TickerProviderStateMixin {
  // Desert Theme Colors - Enhanced palette
  static const Color _skyTop = Color(0xFF2D4A5E);
  static const Color _skyMid = Color(0xFF5C8C7B);
  static const Color _skyGlow = Color(0xFFF4A460);
  static const Color _sand = Color(0xFFDEB887);
  static const Color _sandDark = Color(0xFFC49660);
  static const Color _sunOrange = Color(0xFFFF8C42);
  static const Color _cream = Color(0xFFFFF8E7);
  static const Color _brown = Color(0xFF5C3D2E);
  static const Color _palmGreen = Color(0xFF2E5940);

  late AnimationController _floatController;
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late Animation<double> _floatAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();

    _floatAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

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
              colors: [_skyTop, _skyMid, _skyGlow, _sand, _sandDark],
              stops: [0.0, 0.25, 0.45, 0.65, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Animated stars
              ..._buildAnimatedStars(),

              // Sun glow effect
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Center(
                      child: Container(
                        width: 180 * _pulseAnimation.value,
                        height: 180 * _pulseAnimation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              _sunOrange.withOpacity(0.4),
                              _sunOrange.withOpacity(0.1),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Main Content
              SafeArea(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      // Animated speech bubble
                      AnimatedBuilder(
                        animation: _floatAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _floatAnimation.value * 0.5),
                            child: _buildSpeechBubble(),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      // Main Title with gradient
                      _buildTitle(),
                      const SizedBox(height: 12),
                      // Subtitle
                      Text(
                        'Track your emotions daily',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.85),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(),
                      // Desert illustration with animations
                      _buildDesertIllustration(),
                      const SizedBox(height: 50),
                      // Enhanced Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            _buildPrimaryButton('Get Started'),
                            const SizedBox(height: 16),
                            _buildSecondaryButton('I have an account'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAnimatedStars() {
    return [
      _buildAnimatedStar(top: 50, left: 25, size: 4, delay: 0),
      _buildAnimatedStar(top: 70, right: 50, size: 3, delay: 0.3),
      _buildAnimatedStar(top: 100, left: 80, size: 2, delay: 0.6),
      _buildAnimatedStar(top: 85, right: 100, size: 3, delay: 0.9),
      _buildAnimatedStar(top: 130, left: 140, size: 2, delay: 0.4),
      _buildAnimatedStar(top: 60, right: 130, size: 2.5, delay: 0.7),
      _buildAnimatedStar(top: 150, left: 40, size: 2, delay: 0.2),
      _buildAnimatedStar(top: 110, right: 30, size: 2.5, delay: 0.5),
    ];
  }

  Widget _buildAnimatedStar({
    double? top,
    double? left,
    double? right,
    required double size,
    required double delay,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          final value = math.sin(
            (_pulseController.value + delay) * math.pi * 2,
          );
          return Opacity(
            opacity: 0.5 + (value * 0.5).abs(),
            child: Container(
              width: size + (value * 1).abs(),
              height: size + (value * 1).abs(),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSpeechBubble() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_sunOrange, _sunOrange.withOpacity(0.85)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: _sunOrange.withOpacity(0.4),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wb_sunny_rounded, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            'desert vibes',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.white, _cream],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds),
      child: Column(
        children: [
          Text(
            'MOOD',
            style: GoogleFonts.fredoka(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 0.9,
              letterSpacing: 4,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(3, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Text(
            'DIARY',
            style: GoogleFonts.fredoka(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 0.85,
              letterSpacing: 4,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(3, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesertIllustration() {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Back pyramid (larger, darker)
              Positioned(
                bottom: 30,
                right: 30,
                child: Transform.translate(
                  offset: Offset(0, _floatAnimation.value * 0.2),
                  child: CustomPaint(
                    size: const Size(140, 110),
                    painter: PyramidPainter(
                      color: _sandDark.withOpacity(0.8),
                      shadowColor: _brown.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              // Front pyramid with glow
              Positioned(
                bottom: 30,
                left: 50,
                child: Transform.translate(
                  offset: Offset(0, _floatAnimation.value * 0.15),
                  child: CustomPaint(
                    size: const Size(110, 90),
                    painter: PyramidPainter(
                      color: _sand,
                      shadowColor: _brown.withOpacity(0.25),
                    ),
                  ),
                ),
              ),
              // Palm tree left
              Positioned(
                bottom: 0,
                left: 10,
                child: Transform.translate(
                  offset: Offset(0, -_floatAnimation.value * 0.3),
                  child: _buildPalmTree(60),
                ),
              ),
              // Palm tree right
              Positioned(
                bottom: 0,
                right: 60,
                child: Transform.translate(
                  offset: Offset(0, -_floatAnimation.value * 0.25),
                  child: _buildPalmTree(50),
                ),
              ),
              // Cactus with shadow
              Positioned(
                bottom: 15,
                right: 20,
                child: Transform.translate(
                  offset: Offset(0, -_floatAnimation.value * 0.2),
                  child: _buildCactus(),
                ),
              ),
              // Small cactus
              Positioned(
                bottom: 10,
                left: 100,
                child: Transform.translate(
                  offset: Offset(0, -_floatAnimation.value * 0.15),
                  child: _buildSmallCactus(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPalmTree(double height) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.park_rounded,
          color: _palmGreen,
          size: height,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        Container(
          width: 10,
          height: height * 0.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_brown, _brown.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  Widget _buildCactus() {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Icon(
        Icons.grass_rounded,
        color: const Color(0xFF4A6B3C),
        size: 45,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(2, 2),
            blurRadius: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallCactus() {
    return Icon(
      Icons.grass,
      color: const Color(0xFF5A7B4C),
      size: 28,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(1, 1),
          blurRadius: 2,
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(String text) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_sunOrange, const Color(0xFFFF7043)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _sunOrange.withOpacity(0.4),
            offset: const Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String text) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        color: _cream.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _brown.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: _brown,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Enhanced pyramid painter with shadow
class PyramidPainter extends CustomPainter {
  final Color color;
  final Color shadowColor;

  PyramidPainter({required this.color, required this.shadowColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Shadow
    final shadowPaint = Paint()
      ..color = shadowColor
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final shadowPath = Path()
      ..moveTo(size.width / 2, 5)
      ..lineTo(size.width + 5, size.height + 5)
      ..lineTo(-5, size.height + 5)
      ..close();

    canvas.drawPath(shadowPath, shadowPaint);

    // Main pyramid
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    // Highlight side
    final highlightPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final highlightPath = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 2, size.height * 0.8)
      ..close();

    canvas.drawPath(highlightPath, highlightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
