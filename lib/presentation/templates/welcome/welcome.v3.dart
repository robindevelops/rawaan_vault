import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV3Screen extends StatelessWidget {
  const WelcomeV3Screen({super.key});

  // --- STANDARD COLORS ---
  static const Color primaryPurple = Color(0xFFC0A0E0); // Soft button color
  static const Color primaryYellow = Color(0xFFFDE047); // Highlight color
  static const Color lightBackground = Color(0xFFFFFFFF); // Screen background
  static const Color darkText = Color(0xFF333333); // Main title color
  static const Color lightGreyText = Color(0xFF888888);
  static const Color buttonTextColor = Color(0xFF6B48B4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // --- 1. Top Illustration Section ---
            Expanded(
              flex: 1, // Takes more space (e.g., 66% of vertical space)
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                      "https://img.freepik.com/free-vector/breadwinner-abstract-concept-vector-illustration-earn-money-work-from-home-husband-businessman-working-father-mother-family-needs-support-freelance-work-homemaking-wife-abstract-metaphor_335657-3993.jpg?semt=ais_hybrid&w=740&q=80")
                ],
              ),
            ),

            // --- 2. Bottom Content Section (Title, Description, Button) ---
            Expanded(
              flex: 1, // Takes less space (e.g., 33% of vertical space)
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align content left
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2), // Tighter padding for highlight
                          decoration: BoxDecoration(
                            color: primaryYellow,
                            borderRadius: BorderRadius.circular(25),
                          ), // Slight corner rounding
                          child: Text(
                            "Loan",
                            style: GoogleFonts.poppins(
                              color: darkText,
                              fontSize: 40, // Larger size to match design
                              fontWeight: FontWeight
                                  .w800, // Use w800 for the heavy look
                              height: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // Small spacing between words
                        // "Made" (no background)
                        Text(
                          "Made",
                          style: GoogleFonts.poppins(
                            color: darkText,
                            fontSize: 40, // Consistent large size
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),

                    // Line 2: "Simple"
                    // The image shows 'Simple' starting below the 'Made'/'Loan' alignment
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: primaryYellow,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Simple",
                        style: GoogleFonts.poppins(
                          color: darkText,
                          fontSize: 40, // Consistent large size
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Spacing before description

                    // Description Text
                    Text(
                      "From big plans to small needs, we're here to provide the support you deserve anytime, anywhere.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: lightGreyText,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {
                        // Handle navigation to the next screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryPurple, // Soft purple button
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        elevation: 0,
                      ),
                      child: Text(
                        'Get Started', // Corrected text
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
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
      ),
    );
  }
}
