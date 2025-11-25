import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV2Screen extends StatelessWidget {
  const WelcomeV2Screen({super.key});

  // --- REDESIGNED COLOR PALETTE ---
  // Background: Deep, sophisticated black-green
  static const Color darkBackground =
      Color(0xFF141A14); // Very dark, subtle green-tinted background
  // Primary Accent: Forest Green (for trust and growth)
  static const Color primaryGreen = Color(0xFF1B8349); // #1B8349
  // Secondary Accent: Lighter green for subtle highlights/text buttons
  static const Color secondaryGreen =
      Color(0xFF5CB85C); // A lighter, friendly green

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Consistent Dark Background
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 32.0), // Increased padding for cleaner edges
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Optional: App Logo/Icon
              // Using a cleaner, more modern money/finance icon
              const Icon(
                Icons.trending_up, // Represents growth/investment
                color: primaryGreen, // Use the primary green accent
                size: 96, // Slightly larger icon
              ),
              const SizedBox(height: 48), // Increased spacing

              // 2. Title - Poppins, bold, clear white
              Text(
                "Rawaan The Future of Finance", // Slight text refinement for impact
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30, // Slightly larger title
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1, // Adjusted letter spacing
                ),
              ),
              const SizedBox(height: 16),

              // 3. Subtitle - Roboto, high readability, subtle opacity
              Text(
                "Experience the next generation of banking with Rawaan. Manage your money, track spending, and invest with confidence.",
                textAlign: TextAlign.center,
                maxLines: 4,
                style: GoogleFonts.roboto(
                  color: Colors.white
                      .withOpacity(0.65), // Subtler contrast for body text
                  fontSize: 14,
                  height: 1.4, // Improved line height for multi-line text
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 72), // Increased spacing before CTA

              // 4. Primary Call-to-Action (CTA) Button
              ElevatedButton(
                onPressed: () {
                  // Handle login/get started action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen, // Use the primary green
                  padding: const EdgeInsets.symmetric(
                    vertical: 18.0,
                  ), // Taller button for easier tap
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      14.0,
                    ), // Slightly more rounded corners
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 5. Secondary Action (e.g., Register)
              TextButton(
                onPressed: () {
                  // Handle registration action
                },
                child: Text(
                  'I already have an account', // More explicit text
                  style: GoogleFonts.roboto(
                    color:
                        secondaryGreen, // Use the secondary green for visibility
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
