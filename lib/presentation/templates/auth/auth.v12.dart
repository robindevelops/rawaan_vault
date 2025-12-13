import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v12 - Elegant Gold Theme with Split Layout
class AuthV12Screen extends StatelessWidget {
  const AuthV12Screen({super.key});

  static const Color _background = Color(0xFF0D0D0D);
  static const Color _goldLight = Color(0xFFD4AF37);
  static const Color _goldDark = Color(0xFFAA8C2C);
  static const Color _textSecondary = Color(0xFF888888);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _background,
        body: Column(
          children: [
            // Top Section - Branding
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _goldDark.withValues(alpha: 0.3),
                      _background,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: _goldLight, width: 2),
                        ),
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [_goldLight, _goldDark],
                          ).createShader(bounds),
                          child: const Icon(Icons.diamond,
                              size: 44, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "RAWAAN",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: _goldLight,
                          letterSpacing: 6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "LUXURY EXPERIENCE",
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          color: _textSecondary,
                          letterSpacing: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Section - Auth
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(32, 40, 32, 48),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(32)),
                border: Border(
                    top: BorderSide(color: _goldLight.withValues(alpha: 0.3))),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign in to continue",
                    style: GoogleFonts.montserrat(
                        fontSize: 13, color: _textSecondary),
                  ),
                  const SizedBox(height: 32),
                  // Google Button
                  _buildButton(
                    icon: FontAwesomeIcons.google,
                    text: "Continue with Google",
                    bgColor: const Color(0xFF2A2A2A),
                    textColor: Colors.white,
                    borderColor: _goldLight.withValues(alpha: 0.2),
                  ),
                  const SizedBox(height: 14),
                  // Apple Button
                  _buildButton(
                    icon: FontAwesomeIcons.apple,
                    text: "Continue with Apple",
                    bgColor: Colors.white,
                    textColor: _background,
                  ),
                  const SizedBox(height: 14),
                  // Email Button
                  Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      gradient:
                          const LinearGradient(colors: [_goldLight, _goldDark]),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: _goldLight.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.email_outlined,
                          color: Colors.black, size: 20),
                      label: Text(
                        "Continue with Email",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _background,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New member? ",
                          style: GoogleFonts.montserrat(
                              color: _textSecondary, fontSize: 13)),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Join Now",
                          style: GoogleFonts.montserrat(
                              color: _goldLight,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String text,
    required Color bgColor,
    required Color textColor,
    Color? borderColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: FaIcon(icon, color: textColor, size: 18),
        label: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
