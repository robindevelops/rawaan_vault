import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_login_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_signup_screen.dart';

/// LOZA Welcome Screen
/// Features: Logo with chevron icon, hero chair image, Sign up and Login buttons
class LozoWelcomeScreen extends StatelessWidget {
  const LozoWelcomeScreen({super.key});

  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _background = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: Stack(
        children: [
          // Hero Image - Full Screen
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1567538096621-38d2284b23ff?w=800',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[200],
                child: const Icon(Icons.chair, size: 100, color: Colors.grey),
              ),
            ),
          ),
          // Content Overlay
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // LOZA Logo
                _buildLogo(),
                const Spacer(),
                // Buttons at Bottom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LozoSignupScreen()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: _background,
                            foregroundColor: _primaryBlack,
                            side: const BorderSide(
                                color: _primaryBlack, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LozoLoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primaryBlack,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        // LOZA Text
        Text(
          'LOZA',
          style: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            letterSpacing: 8,
            color: _primaryBlack,
          ),
        ),
      ],
    );
  }
}
