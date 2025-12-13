import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V25 - Glassmorphism Design
/// Features: Blurred glass effect, gradient background
class AuthV25Screen extends StatelessWidget {
  const AuthV25Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            // Colorful Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF6B6B),
                    Color(0xFFFFE66D),
                    Color(0xFF4ECDC4)
                  ],
                ),
              ),
            ),
            // Blob decorations
            Positioned(
                top: 100,
                left: -50,
                child: _buildBlob(200, const Color(0xFFFFE66D))),
            Positioned(
                bottom: 200,
                right: -80,
                child: _buildBlob(250, const Color(0xFF4ECDC4))),
            Positioned(
                top: 300,
                right: 50,
                child: _buildBlob(100, const Color(0xFFFF6B6B))),
            // Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'PRISM',
                      style: GoogleFonts.poppins(
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 6),
                    ),
                    Text('Color your world',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white70)),
                    const Spacer(),
                    // Glass Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Welcome',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildGlassButton(
                              Icons.g_mobiledata_rounded, 'Google'),
                          const SizedBox(height: 12),
                          _buildGlassButton(Icons.apple, 'Apple'),
                          const SizedBox(height: 12),
                          _buildGlassButton(Icons.email_outlined, 'Email'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New here? ",
                            style: GoogleFonts.poppins(color: Colors.white70)),
                        Text('Sign up',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.4),
      ),
    );
  }

  Widget _buildGlassButton(IconData icon, String text) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white, size: 24),
        label: Text(text,
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
          ),
        ),
      ),
    );
  }
}
