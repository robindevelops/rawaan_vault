import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV3Screen extends StatelessWidget {
  const WelcomeV3Screen({super.key});

  // --- STANDARD COLORS ---
  static const Color primaryPurple = Color(0xFFC0A0E0); // Soft button color
  static const Color primaryYellow = Color(0xFFFDE047); // Highlight color
  static const Color lightBackground = Color(0xFFFFFFFF); // Screen background
  static const Color darkText =
      Color(0xFF222222); // Main title color (slightly darker)
  static const Color lightGreyText =
      Color(0xFF6A6A6A); // Slightly darker grey for better readability
  static const Color buttonTextColor =
      darkText; // Use the main dark text color for the button text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      // 1. Use Stack for layering
      body: Stack(
        children: <Widget>[
          // --- BACKGROUND ACCENTS (Layer 1: Subtle decorative elements) ---

          // Yellow Circle (Top Left)
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryYellow.withOpacity(0.5),
              ),
            ),
          ),

          // Purple Rectangle (Bottom Right)
          Positioned(
            bottom: 100,
            right: -20,
            child: Transform.rotate(
              angle: 0.5, // Rotate it slightly
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: primaryPurple.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          // --- MAIN CONTENT (Layer 2: Content Column) ---
          SafeArea(
            child: Column(
              children: <Widget>[
                // --- 1. Top Illustration Section ---
                Expanded(
                  flex:
                      3, // Adjusted flex to 5 to give the illustration slightly more space
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Ensure the image fits nicely within the container
                        Image.network(
                          "https://img.freepik.com/free-vector/breadwinner-abstract-concept-vector-illustration-earn-money-work-from-home-husband-businessman-working-father-mother-family-needs-support-freelance-work-homemaking-wife-abstract-metaphor_335657-3993.jpg?semt=ais_hybrid&w=740&q=80",
                          fit:
                              BoxFit.contain, // Use contain to prevent cropping
                        ),
                      ],
                    ),
                  ),
                ),

                // --- 2. Bottom Content Section (Title, Description, Button) ---
                Expanded(
                  flex: 3, // Adjusted flex to 3
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // --- TITLE SECTION ---
                        Row(
                          children: [
                            // "Loan" (Highlighted)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: primaryYellow,
                                borderRadius:
                                    BorderRadius.circular(8), // Boxier corners
                              ),
                              child: Text(
                                "Loan",
                                style: GoogleFonts.poppins(
                                  color: darkText,
                                  fontSize: 42, // Slightly larger
                                  fontWeight: FontWeight.w900, // Maximum weight
                                  height: 1.0, // Tighter line height
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // "Made" (No background)
                            Text(
                              "Made",
                              style: GoogleFonts.poppins(
                                color: darkText,
                                fontSize: 42,
                                fontWeight: FontWeight.w900,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),

                        // Line 2: "Simple" (Highlighted)
                        Container(
                          margin: const EdgeInsets.only(
                              top: 8), // Small space from line 1
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: primaryYellow,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Simple",
                            style: GoogleFonts.poppins(
                              color: darkText,
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              height: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 24), // Spacing before description

                        // Description Text (Polished)
                        Text(
                          "From big plans to small needs, we're here to provide the financial support you deserve anytime, anywhere.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: lightGreyText,
                            fontSize: 13, // Slightly larger for readability
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 40), // Increased space before button

                        // CTA Button (Polished)
                        ElevatedButton(
                          onPressed: () {
                            // Handle navigation to the next screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ), // More rounded corners
                            ),
                            minimumSize: const Size(double.infinity, 50),
                            elevation: 2,
                          ),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.poppins(
                              color: buttonTextColor,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
