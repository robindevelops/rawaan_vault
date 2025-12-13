import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V21 - Center Card Layout
/// Features: Floating centered card on gradient background
class AuthV21Screen extends StatelessWidget {
  const AuthV21Screen({super.key});

  static const Color _primary = Color(0xFF7C3AED);
  static const Color _secondary = Color(0xFFA78BFA);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [_primary, _secondary, Color(0xFFDDD6FE)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Top spacing
                    const SizedBox(height: 40),
                    // Logo
                    Text(
                      '✦',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'VERTEX',
                      style: GoogleFonts.orbitron(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Floating Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: _primary.withValues(alpha: 0.3),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Welcome back',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Sign in to your account',
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 28),
                          _buildButton(Icons.g_mobiledata_rounded, 'Google',
                              Colors.white, Colors.black87, Colors.grey[300]!),
                          const SizedBox(height: 12),
                          _buildButton(Icons.apple, 'Apple', Colors.black,
                              Colors.white, null),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text('or',
                                    style: GoogleFonts.inter(
                                        fontSize: 12, color: Colors.grey)),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildButton(
                              Icons.email_outlined,
                              'Continue with Email',
                              _primary,
                              Colors.white,
                              null),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New here? ",
                            style: GoogleFonts.inter(color: Colors.white70)),
                        GestureDetector(
                          onTap: () {},
                          child: Text('Create account',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      IconData icon, String text, Color bg, Color fg, Color? border) {
    return SizedBox(
      width: double.infinity,
      height: 52,
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
            borderRadius: BorderRadius.circular(12),
            side: border != null ? BorderSide(color: border) : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
