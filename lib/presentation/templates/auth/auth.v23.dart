import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V23 - Minimal White with Accent
/// Features: Super clean white space, thin accent line
class AuthV23Screen extends StatelessWidget {
  const AuthV23Screen({super.key});

  static const Color _accent = Color(0xFF10B981);
  static const Color _text1 = Color(0xFF111827);
  static const Color _text2 = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                // Accent Line
                Container(width: 40, height: 4, color: _accent),
                const SizedBox(height: 32),
                // Title
                Text(
                  'Hello.',
                  style: GoogleFonts.inter(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: _text1,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue',
                  style: GoogleFonts.inter(fontSize: 16, color: _text2),
                ),
                const Spacer(),
                // Social Icons in Line
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildCircleIcon(Icons.g_mobiledata_rounded),
                    const SizedBox(width: 16),
                    _buildCircleIcon(Icons.apple),
                    const SizedBox(width: 16),
                    _buildCircleIcon(Icons.facebook),
                    const SizedBox(width: 16),
                    _buildCircleIcon(Icons.close), // X (Twitter)
                  ],
                ),
                const SizedBox(height: 32),
                // Divider
                Row(
                  children: [
                    Container(width: 60, height: 1, color: Colors.grey[300]),
                    const SizedBox(width: 12),
                    Text('or',
                        style: GoogleFonts.inter(fontSize: 12, color: _text2)),
                  ],
                ),
                const SizedBox(height: 32),
                // Email Field Style Button
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined, color: _text2, size: 22),
                      const SizedBox(width: 16),
                      Text('Continue with Email',
                          style:
                              GoogleFonts.inter(fontSize: 15, color: _text1)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _accent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('Create Account',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'By continuing you agree to our\nTerms of Service and Privacy Policy',
                  style: GoogleFonts.inter(
                      fontSize: 12, color: _text2, height: 1.5),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Icon(icon, color: _text1, size: 24),
    );
  }
}
