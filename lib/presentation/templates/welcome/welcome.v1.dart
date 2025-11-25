import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- MAIN SCREEN WIDGET ---

class WelcomeV1Screen extends StatefulWidget {
  const WelcomeV1Screen({super.key});

  @override
  State<WelcomeV1Screen> createState() => _WelcomeV1ScreenState();
}

class _WelcomeV1ScreenState extends State<WelcomeV1Screen> {
  // Define primary colors
  final Color neonGreen = const Color(0xFFC7FF36); // Close to the screenshot
  final Color primaryBlack = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neonGreen.withOpacity(0.9),
      body: Column(
        children: [
          // --- 1. Top Neon Green Section (50% Height) ---
          Expanded(
            child: Container(
              width: double.infinity,
              color: neonGreen,
              child: Stack(
                children: [
                  Image.network(
                    "https://jupitergroup.io/wp-content/uploads/2022/06/8373-600x474.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: neonGreen.withOpacity(0.6),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Logo and Illustration Placeholder Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.pie_chart,
                            size: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // CLEO Logo Box
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Rawwan'.toUpperCase(),
                                style: GoogleFonts.quicksand(
                                  color: neonGreen,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            // Illustration Placeholder (Heart Bubble)
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                // Placeholder for the custom illustration/heart bubble
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Hook up Your Account Text
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          "Create\nyour account".toUpperCase(),
                          style: GoogleFonts.cairo(
                            // Using a more modern font
                            color: primaryBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // --- 2. Bottom White Section (50% Height) ---
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), // Increased radius
                  topRight: Radius.circular(30), // Increased radius
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30), // Top spacing

                    // Feature List Items (Content from the screenshot)
                    FeatureListItem(
                      icon: Icons.favorite_border,
                      // Use RichText format for bolding
                      text: 'Set smart **budgets** and **savings goals**',
                    ),
                    FeatureListItem(
                      icon: Icons.bolt,
                      text:
                          'Get **hyped** when you\'re nailing it, and **roasted** when you\'re uh... not',
                    ),
                    FeatureListItem(
                      icon: Icons.lightbulb_outline,
                      text:
                          'Apply for a **Salary Advance** & **Cleo Credit Builder Card**',
                    ),

                    const Spacer(), // Pushes the button and footer to the bottom

                    // Connect Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Connect action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlack,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Connect me'),
                      ),
                    ),

                    // Footer Links
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                      child: Column(
                        children: [
                          const Text(
                            '⍙ Login powered by Plaid',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'I need more info by security',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- FEATURE LIST ITEM WIDGET ---

class FeatureListItem extends StatelessWidget {
  final IconData icon;
  final String text; // Combined title/subtitle into a single rich text string
  final Color primaryColor;

  const FeatureListItem({
    super.key,
    required this.icon,
    required this.text, // Now takes a single string with **bolding**
    this.primaryColor = const Color(0xFF000000),
  });

  // Helper function to parse **bold** text within the string
  List<TextSpan> _parseText(String text, Color textColor) {
    final RegExp exp = RegExp(r'\*\*(.*?)\*\*');
    final List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in exp.allMatches(text)) {
      // Add text before the bold part (normal)
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }

      // Add the bold part
      spans.add(TextSpan(
        text: match.group(1),
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ));

      lastMatchEnd = match.end;
    }

    // Add remaining text (normal)
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Icon (Styled to match the design language) ---
          Container(
            margin: const EdgeInsets.only(
                top: 2), // Slight offset for text alignment
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 2.0),
              shape: BoxShape.circle, // Circular border for a clean look
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 16),

          // --- Rich Text Content ---
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  color: primaryColor,
                  fontSize: 18.0,
                  height: 1.4, // Line spacing
                  fontWeight: FontWeight.normal,
                ),
                children: _parseText(text, primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
