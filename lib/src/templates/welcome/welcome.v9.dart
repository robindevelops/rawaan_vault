import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV9Screen extends StatefulWidget {
  const WelcomeV9Screen({super.key});

  @override
  State<WelcomeV9Screen> createState() => _WelcomeV9ScreenState();
}

class _WelcomeV9ScreenState extends State<WelcomeV9Screen> {
  @override
  Widget build(BuildContext context) {
    const Color darkBackgroundColor = Color(0xFF14171A); // Almost black
    const Color spotifyGreen = Color(0xFF1DB954);

    final double imageSectionHeight = MediaQuery.of(context).size.height * 0.6;

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.network(
            "https://www.billboard.com/wp-content/uploads/2024/07/spotify-photo-logo-app-2024-billboard-pro-1260.jpg?w=942&h=628&crop=1",
            fit: BoxFit.cover,
            height: imageSectionHeight,
            width: double.infinity,
          ),
          Positioned.fill(
            child: Container(
              // The gradient helps fade the image into the dark background color
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkBackgroundColor
                        .withOpacity(0.1), // Top: nearly transparent
                    darkBackgroundColor.withOpacity(0.6),
                    darkBackgroundColor.withOpacity(0.9),
                    darkBackgroundColor, // Bottom: fully opaque, matches scaffold background
                  ],
                  stops: const [
                    0.0,
                    0.5,
                    0.7,
                    1.0
                  ], // Control the spread of the colors
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Center the children horizontally
                children: [
                  // Text Block
                  Text(
                    "Millions of songs.\nFree on Spotify.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32, // Slightly increased size for impact
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(
                      height: 50), // Increased spacing for visual separation

                  // Primary Action Button (Sign up)
                  _buildActionButton(
                    context,
                    text: "Sign up free".toUpperCase(),
                    backgroundColor: spotifyGreen, // Used actual Spotify Green
                    textColor: Colors.black,
                    onPressed: () {},
                  ),

                  const SizedBox(height: 15), // Consistent spacing

                  // Secondary Action Buttons (Login Options)
                  _buildActionButton(
                    context,
                    text: "Continue with phone number".toUpperCase(),
                    icon: Icons.phone_android, // Added an icon for polish
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white,
                    borderColor: Colors.white54, // Added a subtle border
                    onPressed: () {},
                  ),

                  const SizedBox(height: 15),

                  _buildActionButton(
                    context,
                    text: "Continue with facebook".toUpperCase(),
                    icon: Icons.facebook, // Added an icon for polish
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white,
                    borderColor: Colors.white54,
                    onPressed: () {},
                  ),

                  const SizedBox(height: 15),

                  _buildActionButton(
                    context,
                    text: "Continue with google".toUpperCase(),
                    icon: Icons.mail_outline, // Used a generic icon
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white,
                    borderColor: Colors.white54,
                    onPressed: () {},
                  ),

                  const SizedBox(height: 10), // Final small spacing
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Helper Widget remains mostly the same, but with slight style tweaks
Widget _buildActionButton(
  BuildContext context, {
  required String text,
  IconData? icon,
  required Color backgroundColor,
  required Color textColor,
  Color? borderColor,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
