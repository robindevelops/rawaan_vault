import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV10Screen extends StatefulWidget {
  const WelcomeV10Screen({super.key});

  @override
  State<WelcomeV10Screen> createState() => _WelcomeV10ScreenState();
}

class _WelcomeV10ScreenState extends State<WelcomeV10Screen> {
  // McDonald's official colors (or close approximations)
  static const Color mcdonaldsRed = Color(0xFFDA291C);
  static const Color mcdonaldsYellow = Color(0xFFFFC72C);
  static const Color logoColor = mcdonaldsRed;
  static const Color mainTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Keep the background as McDonald's Yellow
      backgroundColor: mcdonaldsYellow,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // The Golden Arches with a subtle shadow for depth
              Text(
                'M',
                style: GoogleFonts.aboreto(
                  color: logoColor,
                  fontSize: 120,
                  fontWeight: FontWeight.w900,
                  height: 0.9,
                  shadows: const [
                    // Added a subtle shadow (Black, slightly offset) for a 3D effect
                    Shadow(
                      color: Colors.black38,
                      offset: Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),

              // Horizontal divider
              Container(
                width: 180,
                height: 4,
                color: mcdonaldsRed,
                margin: const EdgeInsets.only(bottom: 30),
              ),

              // Welcome Text / Slogan
              Text(
                // Use a non-bold text for the whole string and use FontWeight in the style
                "Are you hungry?".toUpperCase(),
                style: GoogleFonts.paprika(
                  color: mainTextColor,
                  fontSize: 26,
                  letterSpacing: 1.0,
                ),
              ),

              const SizedBox(height: 10),

              // Secondary message (Changed to be theme-appropriate)
              const Text(
                "Your next meal is waiting for you", // A more relevant food slogan
                style: TextStyle(
                  color: mainTextColor,
                  fontSize: 14, // Slightly larger and more readable
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 50),

              // Example Button
              ElevatedButton(
                onPressed: () {
                  // Handle navigation or action
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  elevation: 10,
                ),
                child: const Text(
                  'LET\'S ORDER A MEAL ->',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
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
