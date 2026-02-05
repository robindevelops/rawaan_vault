import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Auth Screen V30 - Minimal Dark Design
/// Features: Dark theme, animated illustration, clean auth options
class AuthV30Screen extends StatefulWidget {
  const AuthV30Screen({super.key});

  @override
  State<AuthV30Screen> createState() => _AuthV30ScreenState();
}

class _AuthV30ScreenState extends State<AuthV30Screen> {
  static const Color _darkBg = Color(0xFF0F0F0F);
  static const Color _cardBg = Color(0xFF1A1A1A);
  static const Color _accentGreen = Color(0xFF00D47E);
  static const Color _textGrey = Color(0xFF8E8E93);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Top Illustration Area
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Abstract Shape / Logo
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              _accentGreen,
                              _accentGreen.withValues(alpha: 0.6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.bolt_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'FINTECH',
                        style: GoogleFonts.spaceMono(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 6,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Smart banking for everyone',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: _textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Auth Section
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    // Feature Cards

                    // Auth Buttons
                    _buildAuthButton(
                      text: 'Create Account',
                      backgroundColor: _accentGreen,
                      textColor: Colors.black,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 14),
                    _buildAuthButton(
                      text: 'Sign In',
                      backgroundColor: _cardBg,
                      textColor: Colors.white,
                      borderColor: Colors.white24,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    // Social Login Divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white12)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'or continue with',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: _textGrey,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.white12)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(Icons.g_mobiledata_rounded),
                        const SizedBox(width: 20),
                        _buildSocialIcon(Icons.apple),
                        const SizedBox(width: 20),
                        _buildSocialIcon(Icons.facebook_rounded),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Terms
                    Text(
                      'By signing up, you agree to our Terms & Privacy Policy',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: _textGrey,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _accentGreen, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: _textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }
}
