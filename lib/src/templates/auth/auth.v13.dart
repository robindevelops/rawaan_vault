import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v13 - Nature Theme with Side-by-Side Layout
class AuthV13Screen extends StatelessWidget {
  const AuthV13Screen({super.key});

  static const Color _primaryGreen = Color(0xFF16A34A);
  static const Color _darkGreen = Color(0xFF15803D);
  static const Color _lightBg = Color(0xFFF0FDF4);
  static const Color _text1 = Color(0xFF14532D);
  static const Color _text2 = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Logo Row
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: _primaryGreen,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.eco_rounded,
                          color: Colors.white, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      'Growify',
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: _text1,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Main Content
                Text(
                  'Welcome\nback 🌿',
                  style: GoogleFonts.quicksand(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    color: _text1,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Sign in to nurture your investments',
                  style: GoogleFonts.quicksand(fontSize: 15, color: _text2),
                ),
                const SizedBox(height: 48),
                // Two Column Buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildSquareButton(
                        icon: FontAwesomeIcons.google,
                        label: 'Google',
                        bgColor: _lightBg,
                        iconColor: _text1,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSquareButton(
                        icon: FontAwesomeIcons.apple,
                        label: 'Apple',
                        bgColor: _text1,
                        iconColor: Colors.white,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // OR Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('or',
                          style: GoogleFonts.quicksand(color: _text2)),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),
                const SizedBox(height: 24),
                // Email Button
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined, color: Colors.white),
                    label: Text(
                      'Continue with Email',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Sign Up Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",
                          style: GoogleFonts.quicksand(color: _text2)),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.quicksand(
                              color: _primaryGreen,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Terms
                Center(
                  child: Text(
                    'Terms • Privacy • Help',
                    style: GoogleFonts.quicksand(fontSize: 12, color: _text2),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSquareButton({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color iconColor,
    Color? textColor,
  }) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: iconColor, size: 24),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor ?? _text1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
