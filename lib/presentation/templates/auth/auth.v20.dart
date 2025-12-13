import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// AUTH V20 - Amber/Honey Theme with Horizontal Layout
class AuthV20Screen extends StatelessWidget {
  const AuthV20Screen({super.key});

  static const Color _amber = Color(0xFFF59E0B);
  static const Color _darkAmber = Color(0xFFD97706);
  static const Color _cream = Color(0xFFFFFBEB);
  static const Color _text1 = Color(0xFF1C1917);
  static const Color _text2 = Color(0xFF78716C);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _cream,
        body: SafeArea(
          child: Column(
            children: [
              // Top Brand Strip
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.hexagon_outlined,
                          color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Honeycomb',
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: _text1,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Center Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello\nthere! 👋',
                      style: GoogleFonts.outfit(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: _text1,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Sign in to access your sweet deals',
                      style: GoogleFonts.outfit(fontSize: 16, color: _text2),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Bottom Section - Buttons
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(36)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 30,
                      offset: const Offset(0, -10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Horizontal Social Buttons
                    Row(
                      children: [
                        Expanded(
                            child: _buildIconButton(FontAwesomeIcons.google)),
                        const SizedBox(width: 12),
                        Expanded(
                            child: _buildIconButton(FontAwesomeIcons.apple)),
                        const SizedBox(width: 12),
                        Expanded(
                            child:
                                _buildIconButton(FontAwesomeIcons.facebookF)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey[300])),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('or continue with',
                              style: GoogleFonts.outfit(
                                  color: _text2, fontSize: 13)),
                        ),
                        Expanded(child: Divider(color: Colors.grey[300])),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Email Input Style
                    Container(
                      width: double.infinity,
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: _cream,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.email_outlined, color: _text2, size: 22),
                          const SizedBox(width: 14),
                          Text('Enter your email',
                              style: GoogleFonts.outfit(
                                  color: _text2, fontSize: 15)),
                          const Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.white, size: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New here? ",
                            style: GoogleFonts.outfit(color: _text2)),
                        GestureDetector(
                          onTap: () {},
                          child: Text('Create account',
                              style: GoogleFonts.outfit(
                                  color: _amber, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: FaIcon(icon, color: _text1, size: 20),
      ),
    );
  }
}
