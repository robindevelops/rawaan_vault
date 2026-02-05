import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome Screen V18 - Fitness/Gym Theme
/// Features: Dark gradient, bold typography, energetic design
class WelcomeV18Screen extends StatefulWidget {
  const WelcomeV18Screen({super.key});

  @override
  State<WelcomeV18Screen> createState() => _WelcomeV18ScreenState();
}

class _WelcomeV18ScreenState extends State<WelcomeV18Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  static const Color darkBg = Color(0xFF121212);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color electricBlue = Color(0xFF00D4FF);

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F0F1A),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                // Brand badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: neonGreen, width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "POWER FIT",
                    style: GoogleFonts.orbitron(
                      color: neonGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Main title
                Text(
                  "TRAIN",
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 80,
                    height: 0.9,
                    letterSpacing: 4,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "LIKE A ",
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 48,
                        height: 0.9,
                        letterSpacing: 2,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [neonGreen, electricBlue],
                      ).createShader(bounds),
                      child: Text(
                        "BEAST",
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 48,
                          height: 0.9,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Fitness icon area
                Center(
                  child: AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      return Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: neonGreen.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: neonGreen
                                  .withOpacity(0.2 * _pulseController.value),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: CustomPaint(
                          painter: DumbbellPainter(),
                        ),
                      );
                    },
                  ),
                ),

                const Spacer(),

                // Stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem("500+", "Workouts"),
                    _buildStatItem("50+", "Trainers"),
                    _buildStatItem("24/7", "Access"),
                  ],
                ),

                const SizedBox(height: 40),

                // CTA Button
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            neonGreen,
                            electricBlue,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: neonGreen.withOpacity(0.4),
                            blurRadius: 15 + (_pulseController.value * 10),
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
                          "START YOUR JOURNEY",
                          style: GoogleFonts.orbitron(
                            color: darkBg,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Secondary text
                Center(
                  child: Text(
                    "Free trial for 7 days",
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.bebasNeue(
            color: neonGreen,
            fontSize: 28,
            letterSpacing: 1,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

/// Custom painter for dumbbell icon
class DumbbellPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF39FF14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    // Left weight
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx - 40, center.dy),
          width: 20,
          height: 50,
        ),
        const Radius.circular(4),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx - 50, center.dy),
          width: 12,
          height: 40,
        ),
        const Radius.circular(3),
      ),
      paint,
    );

    // Bar
    canvas.drawLine(
      Offset(center.dx - 30, center.dy),
      Offset(center.dx + 30, center.dy),
      paint,
    );

    // Right weight
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx + 40, center.dy),
          width: 20,
          height: 50,
        ),
        const Radius.circular(4),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx + 50, center.dy),
          width: 12,
          height: 40,
        ),
        const Radius.circular(3),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
