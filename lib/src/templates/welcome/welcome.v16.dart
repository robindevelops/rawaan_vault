import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome Screen V16 - Minimal Bakery/Pastry Theme
/// Features: Warm gradient background, elegant typography, floating pastry icons
class WelcomeV16Screen extends StatefulWidget {
  const WelcomeV16Screen({super.key});

  @override
  State<WelcomeV16Screen> createState() => _WelcomeV16ScreenState();
}

class _WelcomeV16ScreenState extends State<WelcomeV16Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const Color warmCream = Color(0xFFFFF8F0);
  static const Color softBrown = Color(0xFF6B4423);
  static const Color accentPink = Color(0xFFE8A0A0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF5EB),
              Color(0xFFFFE4D1),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Floating decorative elements
              ..._buildFloatingElements(),

              // Main content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Spacer(flex: 2),

                    // Logo/Icon area
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: softBrown.withOpacity(0.1),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: CustomPaint(
                        painter: CroissantPainter(),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Title
                    Text(
                      "Sweet",
                      style: GoogleFonts.playfairDisplay(
                        color: softBrown,
                        fontSize: 56,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "MOMENTS",
                      style: GoogleFonts.josefinSans(
                        color: softBrown,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 12,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Divider with dot
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 1,
                          color: accentPink,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: accentPink,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          height: 1,
                          color: accentPink,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Tagline
                    Text(
                      "Artisan pastries baked\nfresh every morning",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lora(
                        color: softBrown.withOpacity(0.7),
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),

                    const Spacer(flex: 2),

                    // CTA Button
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8B5A3C), Color(0xFF6B4423)],
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: softBrown.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
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
                          "Explore Our Menu",
                          style: GoogleFonts.josefinSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Secondary button
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Find a Store",
                        style: GoogleFonts.lora(
                          color: softBrown.withOpacity(0.6),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingElements() {
    return [
      Positioned(
        top: 80,
        left: 30,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _controller.value * 10),
              child: _buildFloatingIcon("✦", 20, accentPink.withOpacity(0.5)),
            );
          },
        ),
      ),
      Positioned(
        top: 150,
        right: 40,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_controller.value * 8),
              child: _buildFloatingIcon("◇", 16, softBrown.withOpacity(0.3)),
            );
          },
        ),
      ),
      Positioned(
        bottom: 200,
        left: 50,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _controller.value * 12),
              child: _buildFloatingIcon("○", 14, accentPink.withOpacity(0.4)),
            );
          },
        ),
      ),
    ];
  }

  Widget _buildFloatingIcon(String icon, double size, Color color) {
    return Text(
      icon,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}

/// Custom painter for croissant icon
class CroissantPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6B4423)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    // Croissant crescent shape
    final path = Path();
    path.moveTo(center.dx - 25, center.dy + 5);
    path.quadraticBezierTo(
      center.dx - 15,
      center.dy - 20,
      center.dx,
      center.dy - 15,
    );
    path.quadraticBezierTo(
      center.dx + 15,
      center.dy - 20,
      center.dx + 25,
      center.dy + 5,
    );
    path.quadraticBezierTo(
      center.dx + 20,
      center.dy + 15,
      center.dx,
      center.dy + 10,
    );
    path.quadraticBezierTo(
      center.dx - 20,
      center.dy + 15,
      center.dx - 25,
      center.dy + 5,
    );

    canvas.drawPath(path, paint);

    // Decorative lines
    canvas.drawLine(
      Offset(center.dx - 10, center.dy - 5),
      Offset(center.dx - 5, center.dy + 5),
      paint,
    );
    canvas.drawLine(
      Offset(center.dx + 5, center.dy - 5),
      Offset(center.dx + 10, center.dy + 5),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
