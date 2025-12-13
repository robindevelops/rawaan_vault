import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome V12 - Real Estate / Dream House Theme
/// Features: Hero image with logo overlay, curved bottom sheet, Login/Sign Up buttons
class WelcomeV12Screen extends StatefulWidget {
  const WelcomeV12Screen({super.key});

  @override
  State<WelcomeV12Screen> createState() => _WelcomeV12ScreenState();
}

class _WelcomeV12ScreenState extends State<WelcomeV12Screen> {
  static const Color _primaryDark = Color(0xFF1A1A1A);
  static const Color _textSecondary = Color(0xFF6B7280);
  static const Color _background = Color(0xFFFFFFFF);
  static const Color _borderColor = Color(0xFFE5E5E5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: Stack(
        children: [
          // Hero Image Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ClipRRect(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  // Background Image
                  Image.network(
                    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF3D4F5F),
                      child: const Icon(Icons.home,
                          size: 80, color: Colors.white54),
                    ),
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                  // Logo and Brand Name
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo Circle
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star_outline,
                                    color: Colors.white, size: 24),
                                Text(
                                  'RAWAAN',
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Brand Name
                        Text(
                          'RAWAAN',
                          style: GoogleFonts.cairo(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            // letterSpacing: 6,
                          ),
                        ),
                        Text(
                          'Dream House',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.6),
                            // letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom White Section with Curve
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: _background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                children: [
                  // Welcome Text
                  Text(
                    'WELCOME',
                    style: GoogleFonts.fjallaOne(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: _primaryDark,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Subtitle
                  Text(
                    'Find your next space, feel at home',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: _textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Where comfort meets convenience',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: _textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryDark,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _primaryDark,
                        side: BorderSide(color: _borderColor, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
