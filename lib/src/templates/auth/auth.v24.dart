import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V24 - Dark Mode with Neon Accent
/// Features: Dark background, neon green accents, modern tech feel
class AuthV24Screen extends StatelessWidget {
  const AuthV24Screen({super.key});

  static const Color _bg = Color(0xFF0A0A0A);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _neon = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 50),
                // Logo with glow
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: _card,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: _neon.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 2),
                    ],
                  ),
                  child: Icon(Icons.flash_on_rounded, size: 40, color: _neon),
                ),
                const SizedBox(height: 24),
                Text(
                  'SPARK',
                  style: GoogleFonts.spaceMono(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                      color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text('Next-gen authentication',
                    style:
                        GoogleFonts.inter(fontSize: 13, color: Colors.white38)),
                const Spacer(),
                // Auth Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: _card,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    children: [
                      Text('Sign In',
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(height: 24),
                      _buildButton(Icons.fingerprint, 'Biometric Sign In',
                          _neon, Colors.black),
                      const SizedBox(height: 12),
                      _buildButton(Icons.email_outlined, 'Email & Password',
                          _card, Colors.white, Colors.white24),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSmallIcon(Icons.g_mobiledata_rounded),
                          const SizedBox(width: 20),
                          _buildSmallIcon(Icons.apple),
                          const SizedBox(width: 20),
                          _buildSmallIcon(Icons.key),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New user? ",
                        style: GoogleFonts.inter(color: Colors.white38)),
                    GestureDetector(
                      onTap: () {},
                      child: Text('Create account',
                          style: GoogleFonts.inter(
                              color: _neon, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String text, Color bg, Color fg,
      [Color? border]) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: fg, size: 22),
        label: Text(text,
            style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w500, color: fg)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: border != null ? BorderSide(color: border) : BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSmallIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Icon(icon, color: Colors.white54, size: 22),
    );
  }
}
