import 'package:flutter/material.dart';

// Note: Assuming this screen will be integrated into a larger app structure.
// If running as standalone, ensure you wrap it in a MaterialApp.

class WelcomeV6Screen extends StatelessWidget {
  const WelcomeV6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the color scheme
    const Color darkBackgroundColor = Color(0xFF14171A); // Almost black
    const Color neonGreen = Color(0xFF6CF005); // Bright, energetic green
    const Color lightGreen = Color(0xFFC8F635); // For the speech bubble

    // Get screen dimensions for responsive positioning
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Stack(
        children: [
          // --- 1. Main Content: Headline and Character ---
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Headline Text ---
                  _buildHeadline(neonGreen),

                  // --- Spacer to push content down slightly (Optional) ---
                  SizedBox(height: screenHeight * 0.05),

                  // The rest of the screen is occupied by the character in the Stack
                ],
              ),
            ),
          ),

          // --- 2. Character (MOE) ---
          // Positioned the character blob near the bottom right
          Positioned(
            bottom: -50, // Slightly off-screen to replicate the cropped look
            right: -screenWidth * 0.1, // Adjusted based on screen width
            child: Transform.rotate(
              angle: 0.15, // Slight rotation for the dynamic angle
              child: Container(
                width: screenWidth * 0.8, // Large size relative to screen
                height: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: neonGreen,
                  borderRadius: BorderRadius.circular(50), // Perfect oval/blob
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '0 0',
                              style: TextStyle(
                                fontSize: 60,
                                color: darkBackgroundColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '◡',
                          style: TextStyle(
                            fontSize: 60,
                            color: darkBackgroundColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // --- 3. Speech Bubble ---
          Positioned(
            bottom: screenHeight * 0.1, // Position relative to screen height
            left: screenWidth * 0.1, // Position relative to screen width
            child: _buildSpeechBubble(lightGreen),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "GO FOR" text with slight spacing adjustment
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'GO FOR',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.0,
              ),
            ),
            // The small green accent circle/shape
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 10),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),

        // "BETTER" text
        Text(
          'BETTER',
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 60,
            color: accentColor,
            fontWeight: FontWeight.w900,
            height: 1.0,
            letterSpacing: -1.0, // Tighten up the spacing
          ),
        ),

        // "HABITS" text
        Text(
          'HABITS',
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 60,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.0,
            letterSpacing: -1.0,
          ),
        ),

        // "WITH" text
        Text(
          'WITH',
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),

        // "MOE" text
        Text(
          'MOE',
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 60,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.0,
            letterSpacing: -1.0,
          ),
        ),

        // Wavy line accent underneath "MOE"
        Container(
          height: 3,
          width: 100,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            // In a real app, this would be a custom path for a wavy line
          ),
        ),
        SizedBox(height: 20),

        OutlinedButton(
          onPressed: () {},
          child: Text(
            'Start Now',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.0,
              letterSpacing: -1.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpeechBubble(Color bubbleColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black, width: 1), // Black outline
      ),
      child: const Text(
        'IT\'S MORE FUN\nTOGETHER!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.2,
        ),
      ),
    );
  }
}
