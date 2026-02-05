import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome Screen V19 - Spa/Wellness Theme
/// Features: Calm colors, zen aesthetic, minimal design
class WelcomeV19Screen extends StatefulWidget {
  const WelcomeV19Screen({super.key});

  @override
  State<WelcomeV19Screen> createState() => _WelcomeV19ScreenState();
}

class _WelcomeV19ScreenState extends State<WelcomeV19Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _breatheController;

  static const Color sageGreen = Color(0xFF8FA68A);
  static const Color creamWhite = Color(0xFFFAF8F5);
  static const Color warmBeige = Color(0xFFE8DFD5);
  static const Color deepForest = Color(0xFF2C3E2D);

  @override
  void initState() {
    super.initState();
    _breatheController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breatheController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Lotus icon with breathing animation
              AnimatedBuilder(
                animation: _breatheController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_breatheController.value * 0.05),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CustomPaint(
                        painter: LotusPainter(),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              // Brand name
              Text(
                "serenity",
                style: GoogleFonts.cormorantGaramond(
                  color: deepForest,
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 8,
                ),
              ),

              // Tagline
              Text(
                "SPA & WELLNESS",
                style: GoogleFonts.montserrat(
                  color: sageGreen,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 6,
                ),
              ),

              const Spacer(),

              // Decorative line with leaves
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLeafIcon(true),
                  Container(
                    width: 80,
                    height: 1,
                    color: sageGreen.withOpacity(0.5),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: sageGreen, width: 1),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 1,
                    color: sageGreen.withOpacity(0.5),
                  ),
                  _buildLeafIcon(false),
                ],
              ),

              const SizedBox(height: 40),

              // Quote
              Text(
                "Find your inner peace",
                textAlign: TextAlign.center,
                style: GoogleFonts.cormorantGaramond(
                  color: deepForest.withOpacity(0.8),
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Discover a sanctuary of calm where\nmind, body, and spirit unite",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: deepForest.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 1.6,
                ),
              ),

              const Spacer(),

              // Services icons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildServiceItem("🧘", "Yoga"),
                  _buildServiceItem("💆", "Massage"),
                  _buildServiceItem("🌿", "Therapy"),
                ],
              ),

              const SizedBox(height: 50),

              // Book button
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: deepForest,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    "Book Your Experience",
                    style: GoogleFonts.montserrat(
                      color: creamWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Explore link
              TextButton(
                onPressed: () {},
                child: Text(
                  "Explore Treatments",
                  style: GoogleFonts.montserrat(
                    color: sageGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: sageGreen,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeafIcon(bool flipHorizontal) {
    return Transform.flip(
      flipX: flipHorizontal,
      child: Text(
        "🍃",
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildServiceItem(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: warmBeige.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: deepForest.withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

/// Custom painter for lotus flower
class LotusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8FA68A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2 + 10);

    // Center petal
    _drawPetal(canvas, center, 0, paint);

    // Left petals
    _drawPetal(canvas, center, -0.4, paint);
    _drawPetal(canvas, center, -0.8, paint);

    // Right petals
    _drawPetal(canvas, center, 0.4, paint);
    _drawPetal(canvas, center, 0.8, paint);

    // Base
    final basePath = Path();
    basePath.moveTo(center.dx - 25, center.dy + 15);
    basePath.quadraticBezierTo(
      center.dx,
      center.dy + 25,
      center.dx + 25,
      center.dy + 15,
    );
    canvas.drawPath(basePath, paint);
  }

  void _drawPetal(Canvas canvas, Offset center, double angle, Paint paint) {
    final path = Path();
    final startX = center.dx + (angle * 30);
    final startY = center.dy + 10;

    path.moveTo(startX, startY);
    path.quadraticBezierTo(
      startX - 10,
      center.dy - 25,
      center.dx + (angle * 15),
      center.dy - 35,
    );
    path.quadraticBezierTo(
      center.dx + (angle * 20) + 10,
      center.dy - 25,
      startX,
      startY,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
