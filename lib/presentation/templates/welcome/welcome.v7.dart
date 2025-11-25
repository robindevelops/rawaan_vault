import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV7Screen extends StatefulWidget {
  const WelcomeV7Screen({super.key});

  @override
  State<WelcomeV7Screen> createState() => _WelcomeV7ScreenState();
}

class _WelcomeV7ScreenState extends State<WelcomeV7Screen> {
  // Define a strong accent color for the CTA
  static const Color accentColor = Color(0xFF4CAF50); // A fresh, vibrant green

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Ensure the background color is black/transparent since the image covers everything
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Background Image (Full screen)
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://media.istockphoto.com/id/1347863544/vector/couple-climbers-climbing-to-top-at-dawn-travel-concept-of-discovering-exploring-and.jpg?s=612x612&w=0&k=20&c=6ggNE5LiR_cFNCQQsxkwIPaNl2AdzYWK2l1au0jjNDc=",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Stronger Gradient Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0), // Start fully visible
                    Colors.black.withOpacity(0.4),
                    Colors.black
                        .withOpacity(0.85), // Strong opacity at the bottom
                  ],
                  stops: const [0.0, 0.5, 1.0], // Smoother transition to black
                ),
              ),
            ),
          ),

          // 3. Top-of-Screen Element (e.g., Logo/Icon)
          Positioned(
            top: screenHeight * 0.08, // Responsive position
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.landscape_outlined, // A fitting icon
                  color: accentColor, // Using the CTA color for branding
                  size: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  "Adventure App",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // 4. Main Content: Title, Subtitle, and Call-to-Action Button
          Positioned(
            // Adjusted position slightly lower for better balance
            bottom: screenHeight * 0.08,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title (Using an impactful Google Font)
                Text(
                  "Its a Big World",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5, // Reduced letter spacing for polish
                  ),
                ),
                // Subtitle (Using a light, contrasting weight)
                Text(
                  "Out There, Go Explore",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400, // Medium weight
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40), // Increased spacing

                // Call-to-Action Button (Enhanced Style)
                SizedBox(
                  width: double.infinity,
                  height: 60, // Slightly taller for more presence
                  child: ElevatedButton(
                    onPressed: () {
                      // Action to navigate
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor, // The vibrant green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Pill shape
                      ),
                      elevation: 10, // Increased shadow for floating effect
                      shadowColor:
                          accentColor.withOpacity(0.4), // Color the shadow
                    ),
                    child: Text(
                      "Start Your Journey",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700, // Strong text for CTA
                      ),
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
