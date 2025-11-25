import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV2Screen extends StatelessWidget {
  const WelcomeV2Screen({super.key});

  // --- REDESIGNED COLOR PALETTE ---
  // Background: Deep, sophisticated black-green
  static const Color darkBackground = Color(0xFF141A14);
  static const Color primaryGreen = Color(0xFF1B8349);
  static const Color secondaryGreen = Color(0xFF5CB85C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -150,
            left: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    primaryGreen.withOpacity(0.3),
                    darkBackground.withOpacity(0.0),
                  ],
                  stops: const [0.1, 1.0],
                ),
              ),
            ),
          ),

          // Another subtle element on the opposite corner
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryGreen.withOpacity(0.1),
              ),
            ),
          ),

          // --- MAIN CONTENT (Interactive and Centered) ---

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(
                    Icons.trending_up,
                    color: primaryGreen,
                    size: 100,
                  ),
                  const SizedBox(height: 50),

                  Text(
                    "Rawaan: Future of Finance",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12), // Reduced space

                  // 3. Subtitle - Roboto, high readability (Polished)
                  Text(
                    "Experience the next generation of banking with Rawaan. Manage your money, track spending, and invest with confidence.",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 13, // Better size for body text
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 80), // Increased spacing before CTA

                  // 4. Primary Call-to-Action (CTA) Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle login/get started action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: primaryGreen.withOpacity(0.4),
                      elevation: 10,
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 5. Secondary Action
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'I already have an account',
                      style: GoogleFonts.roboto(
                        color: secondaryGreen,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
