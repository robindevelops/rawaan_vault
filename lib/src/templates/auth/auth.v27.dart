import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V27 - Warm Minimal Design
/// Features: Clean layout, warm sand tones, elegant typography
class AuthV27Screen extends StatefulWidget {
  const AuthV27Screen({super.key});
  @override
  State<AuthV27Screen> createState() => _AuthV27ScreenState();
}

class _AuthV27ScreenState extends State<AuthV27Screen> {
  static const Color _bg = Color(0xFFFBF9F4);
  static const Color _primary = Color(0xFF6B5B4F);
  static const Color _text1 = Color(0xFF3D352C);
  static const Color _text2 = Color(0xFF8C7C6D);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              // Top Section with Logo
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: _primary,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'R',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'RAWAAN',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 4,
                          color: _text1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Neighbors helping neighbors',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: _text2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Auth Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(28, 40, 28, 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: _text1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: _text2,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Google Button
                    _buildAuthButton(
                      icon: Icons.g_mobiledata_rounded,
                      text: 'Continue with Google',
                      backgroundColor: Colors.white,
                      textColor: _text1,
                      borderColor: const Color(0xFFE6E0D5),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 14),
                    // Apple Button
                    _buildAuthButton(
                      icon: Icons.apple,
                      text: 'Continue with Apple',
                      backgroundColor: _text1,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 14),
                    // Email Button
                    _buildAuthButton(
                      icon: Icons.email_outlined,
                      text: 'Continue with Email',
                      backgroundColor: _primary,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 32),
                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: _text2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Terms
                    Text(
                      'By continuing, you agree to our Terms & Privacy Policy',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: _text2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton({
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: textColor, size: 24),
        label: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 1.5)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
