import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV15Screen extends StatefulWidget {
  const WelcomeV15Screen({super.key});

  @override
  State<WelcomeV15Screen> createState() => _WelcomeV15ScreenState();
}

class _WelcomeV15ScreenState extends State<WelcomeV15Screen> {
  // Deep blue color from the design
  static const Color deepBlue = Color.fromARGB(255, 1, 33, 128);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Title "COOL CAT'S"
              Text(
                "COOL\nCAT'S",
                textAlign: TextAlign.center,
                style: GoogleFonts.bangers(
                  color: Colors.white,
                  fontSize: 80,
                  height: 0.9,
                  letterSpacing: 2,
                ),
              ),

              // Cat illustration - using a placeholder with custom paint
              SizedBox(
                height: 280,
                width: 280,
                child: CustomPaint(
                  painter: CoolCatPainter(),
                ),
              ),

              const Spacer(),

              // Tagline
              Text(
                "come for the Brew,",
                style: GoogleFonts.caveat(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Stay for the vibes",
                style: GoogleFonts.caveat(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 40),

              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOutlineButton("Bookings", () {
                    // Handle bookings
                  }),
                  const SizedBox(width: 20),
                  _buildOutlineButton("Menu", () {
                    // Handle menu
                  }),
                ],
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOutlineButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Custom painter to draw a simple cat illustration
class CoolCatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    // Surfboard
    final surfboardPath = Path();
    surfboardPath.moveTo(center.dx - 80, center.dy + 60);
    surfboardPath.quadraticBezierTo(
      center.dx - 40,
      center.dy + 40,
      center.dx + 20,
      center.dy + 50,
    );
    surfboardPath.quadraticBezierTo(
      center.dx + 100,
      center.dy + 60,
      center.dx + 120,
      center.dy + 80,
    );
    surfboardPath.quadraticBezierTo(
      center.dx + 100,
      center.dy + 100,
      center.dx + 20,
      center.dy + 90,
    );
    surfboardPath.quadraticBezierTo(
      center.dx - 40,
      center.dy + 80,
      center.dx - 80,
      center.dy + 60,
    );
    canvas.drawPath(surfboardPath, paint);

    // Cat body (oval)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy - 10),
        width: 70,
        height: 90,
      ),
      paint,
    );

    // Cat head
    canvas.drawCircle(Offset(center.dx, center.dy - 70), 35, paint);

    // Cat ears
    final leftEar = Path();
    leftEar.moveTo(center.dx - 25, center.dy - 95);
    leftEar.lineTo(center.dx - 35, center.dy - 120);
    leftEar.lineTo(center.dx - 10, center.dy - 100);
    canvas.drawPath(leftEar, paint);

    final rightEar = Path();
    rightEar.moveTo(center.dx + 25, center.dy - 95);
    rightEar.lineTo(center.dx + 35, center.dy - 120);
    rightEar.lineTo(center.dx + 10, center.dy - 100);
    canvas.drawPath(rightEar, paint);

    // Sunglasses
    canvas.drawRect(
      Rect.fromLTWH(center.dx - 28, center.dy - 80, 22, 15),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(center.dx + 6, center.dy - 80, 22, 15),
      paint,
    );
    canvas.drawLine(
      Offset(center.dx - 6, center.dy - 72),
      Offset(center.dx + 6, center.dy - 72),
      paint,
    );

    // Cat arm holding coffee
    final armPath = Path();
    armPath.moveTo(center.dx + 30, center.dy - 20);
    armPath.quadraticBezierTo(
      center.dx + 60,
      center.dy - 40,
      center.dx + 70,
      center.dy - 60,
    );
    canvas.drawPath(armPath, paint);

    // Coffee cup
    canvas.drawRect(
      Rect.fromLTWH(center.dx + 60, center.dy - 90, 25, 30),
      paint,
    );
    // Cup handle
    canvas.drawArc(
      Rect.fromLTWH(center.dx + 82, center.dy - 85, 15, 20),
      -1.5,
      3.14,
      false,
      paint,
    );
    // Steam
    final steamPath = Path();
    steamPath.moveTo(center.dx + 68, center.dy - 95);
    steamPath.quadraticBezierTo(
      center.dx + 65,
      center.dy - 105,
      center.dx + 70,
      center.dy - 115,
    );
    canvas.drawPath(steamPath, paint);

    // Cat tail
    final tailPath = Path();
    tailPath.moveTo(center.dx - 35, center.dy + 30);
    tailPath.quadraticBezierTo(
      center.dx - 80,
      center.dy + 20,
      center.dx - 90,
      center.dy + 60,
    );
    canvas.drawPath(tailPath, paint);

    // Cat legs
    canvas.drawLine(
      Offset(center.dx - 15, center.dy + 35),
      Offset(center.dx - 20, center.dy + 55),
      paint,
    );
    canvas.drawLine(
      Offset(center.dx + 15, center.dy + 35),
      Offset(center.dx + 20, center.dy + 55),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
