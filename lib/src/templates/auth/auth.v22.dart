import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V22 - Top Image, Bottom Actions Layout
/// Features: Like AuthV1 - image/animation on top, buttons on bottom
class AuthV22Screen extends StatelessWidget {
  const AuthV22Screen({super.key});

  static const Color _primary = Color(0xFF0EA5E9);
  static const Color _text1 = Color(0xFF0F172A);
  static const Color _text2 = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F9FF),
        body: Column(
          children: [
            // Top Section - Illustration Area
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF0EA5E9), Color(0xFF38BDF8)],
                      ),
                    ),
                  ),
                  // Decorative circles
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -30,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  // Content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        Icon(Icons.cloud_outlined,
                            size: 80, color: Colors.white),
                        const SizedBox(height: 20),
                        Text(
                          'CLOUDY',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 4,
                            color: Colors.white,
                          ),
                        ),
                        Text('Your data, everywhere',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Section - Auth Buttons
            Expanded(
              flex: 3,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                child: Column(
                  children: [
                    Text('Get Started',
                        style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: _text1)),
                    const SizedBox(height: 8),
                    Text('Choose how to sign in',
                        style:
                            GoogleFonts.poppins(fontSize: 14, color: _text2)),
                    const SizedBox(height: 32),
                    _buildOutlinedButton(
                        Icons.g_mobiledata_rounded, 'Continue with Google'),
                    const SizedBox(height: 12),
                    _buildFilledButton(
                        Icons.email_outlined, 'Continue with Email', _primary),
                    const Spacer(),
                    Text("Terms of Service • Privacy Policy",
                        style:
                            GoogleFonts.poppins(fontSize: 11, color: _text2)),
                    Text("© 2024 Cloudy Inc.",
                        style:
                            GoogleFonts.poppins(fontSize: 11, color: _text2)),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(IconData icon, String text) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 24, color: _text1),
        label: Text(text,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w500, color: _text1)),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey[300]!, width: 1.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  Widget _buildFilledButton(IconData icon, String text, Color color) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 22, color: Colors.white),
        label: Text(text,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
