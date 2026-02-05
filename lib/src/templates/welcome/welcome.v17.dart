import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome Screen V17 - Neon Nightclub/Bar Theme
/// Features: Dark background, neon glow effects, bold typography
class WelcomeV17Screen extends StatefulWidget {
  const WelcomeV17Screen({super.key});

  @override
  State<WelcomeV17Screen> createState() => _WelcomeV17ScreenState();
}

class _WelcomeV17ScreenState extends State<WelcomeV17Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;

  static const Color darkBg = Color(0xFF0D0D0D);
  static const Color neonPink = Color(0xFFFF2D95);
  static const Color neonBlue = Color(0xFF00E5FF);
  static const Color neonPurple = Color(0xFFBF40BF);

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: Stack(
        children: [
          // Background gradient circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    neonPink.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    neonBlue.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // Neon sign effect title
                  AnimatedBuilder(
                    animation: _glowController,
                    builder: (context, child) {
                      return Column(
                        children: [
                          // Main title with neon glow
                          Text(
                            "NEON",
                            style: GoogleFonts.righteous(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: neonPink,
                              shadows: [
                                Shadow(
                                  color: neonPink.withOpacity(
                                    0.5 + (_glowController.value * 0.5),
                                  ),
                                  blurRadius: 20 + (_glowController.value * 20),
                                ),
                                Shadow(
                                  color: neonPink.withOpacity(0.3),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "NIGHTS",
                            style: GoogleFonts.righteous(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: neonBlue,
                              letterSpacing: 8,
                              shadows: [
                                Shadow(
                                  color: neonBlue.withOpacity(
                                    0.5 + (_glowController.value * 0.5),
                                  ),
                                  blurRadius: 15 + (_glowController.value * 15),
                                ),
                                Shadow(
                                  color: neonBlue.withOpacity(0.3),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const Spacer(),

                  // Neon cocktail illustration
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: AnimatedBuilder(
                      animation: _glowController,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: NeonCocktailPainter(
                            glowIntensity: _glowController.value,
                          ),
                        );
                      },
                    ),
                  ),

                  const Spacer(),

                  // Tagline
                  Text(
                    "Where the night",
                    style: GoogleFonts.montserrat(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [neonPink, neonPurple, neonBlue],
                    ).createShader(bounds),
                    child: Text(
                      "comes alive",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Enter button with neon border
                  AnimatedBuilder(
                    animation: _glowController,
                    builder: (context, child) {
                      return Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: neonPink,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: neonPink.withOpacity(
                                0.3 + (_glowController.value * 0.3),
                              ),
                              blurRadius: 15 + (_glowController.value * 10),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "ENTER",
                            style: GoogleFonts.orbitron(
                              color: neonPink,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 8,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Reserve button
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          neonPink.withOpacity(0.8),
                          neonPurple.withOpacity(0.8),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: neonPurple.withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "RESERVE A TABLE",
                        style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for neon cocktail glass
class NeonCocktailPainter extends CustomPainter {
  final double glowIntensity;

  NeonCocktailPainter({required this.glowIntensity});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Neon pink paint
    final pinkPaint = Paint()
      ..color = const Color(0xFFFF2D95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(
        BlurStyle.outer,
        5 + (glowIntensity * 10),
      );

    // Inner line paint
    final innerPaint = Paint()
      ..color = const Color(0xFFFF2D95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Blue accent paint
    final bluePaint = Paint()
      ..color = const Color(0xFF00E5FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(
        BlurStyle.outer,
        3 + (glowIntensity * 5),
      );

    // Martini glass shape
    final glassPath = Path();
    // Top of glass (wide part)
    glassPath.moveTo(center.dx - 50, center.dy - 30);
    glassPath.lineTo(center.dx + 50, center.dy - 30);
    // Sides tapering down
    glassPath.lineTo(center.dx, center.dy + 30);
    glassPath.lineTo(center.dx - 50, center.dy - 30);

    canvas.drawPath(glassPath, pinkPaint);
    canvas.drawPath(glassPath, innerPaint);

    // Glass stem
    canvas.drawLine(
      Offset(center.dx, center.dy + 30),
      Offset(center.dx, center.dy + 60),
      pinkPaint,
    );
    canvas.drawLine(
      Offset(center.dx, center.dy + 30),
      Offset(center.dx, center.dy + 60),
      innerPaint,
    );

    // Glass base
    canvas.drawLine(
      Offset(center.dx - 25, center.dy + 60),
      Offset(center.dx + 25, center.dy + 60),
      pinkPaint,
    );
    canvas.drawLine(
      Offset(center.dx - 25, center.dy + 60),
      Offset(center.dx + 25, center.dy + 60),
      innerPaint,
    );

    // Liquid line
    canvas.drawLine(
      Offset(center.dx - 35, center.dy - 15),
      Offset(center.dx + 35, center.dy - 15),
      bluePaint,
    );

    // Olive on stick
    canvas.drawCircle(
      Offset(center.dx + 20, center.dy - 40),
      8,
      bluePaint,
    );
    canvas.drawLine(
      Offset(center.dx + 5, center.dy - 25),
      Offset(center.dx + 30, center.dy - 50),
      bluePaint,
    );

    // Bubbles
    final bubblePaint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(0.5 + glowIntensity * 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(Offset(center.dx - 10, center.dy - 5), 4, bubblePaint);
    canvas.drawCircle(Offset(center.dx + 15, center.dy - 8), 3, bubblePaint);
    canvas.drawCircle(Offset(center.dx - 5, center.dy + 5), 2, bubblePaint);
  }

  @override
  bool shouldRepaint(covariant NeonCocktailPainter oldDelegate) =>
      oldDelegate.glowIntensity != glowIntensity;
}
