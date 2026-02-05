import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Auth Screen V29 - Modern Gradient Design
/// Features: Gradient background, centered logo, social auth buttons
class AuthV29Screen extends StatefulWidget {
  const AuthV29Screen({super.key});

  @override
  State<AuthV29Screen> createState() => _AuthV29ScreenState();
}

class _AuthV29ScreenState extends State<AuthV29Screen> {
  static const Color _primaryPurple = Color(0xFF6C63FF);
  static const Color _darkPurple = Color(0xFF4A42D6);
  static const Color _lightPurple = Color(0xFF9D97FF);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_primaryPurple, _darkPurple],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Section with Logo
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Icon
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // App Name
                      Text(
                        'SHOPIFY',
                        style: GoogleFonts.poppins(
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Shop smarter, live better',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Card with Auth Buttons
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue shopping',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Google Button
                    _buildSocialButton(
                      icon: Icons.g_mobiledata_rounded,
                      text: 'Continue with Google',
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                      borderColor: Colors.grey[300]!,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 14),
                    // Apple Button
                    _buildSocialButton(
                      icon: Icons.apple,
                      text: 'Continue with Apple',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 14),
                    // Email Button
                    _buildSocialButton(
                      icon: Icons.email_outlined,
                      text: 'Continue with Email',
                      backgroundColor: _primaryPurple,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    // Terms
                    Text(
                      'By continuing, you agree to our Terms of Service',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[500],
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

  Widget _buildSocialButton({
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
          style: GoogleFonts.poppins(
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
