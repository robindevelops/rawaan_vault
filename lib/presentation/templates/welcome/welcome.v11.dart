import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

class WelcomeV11Screen extends StatefulWidget {
  const WelcomeV11Screen({super.key});

  @override
  State<WelcomeV11Screen> createState() => _WelcomeV11ScreenState();
}

class _WelcomeV11ScreenState extends State<WelcomeV11Screen> {
  // --- Design Constants ---
  final Color _backgroundColor = const Color.fromARGB(255, 184, 247, 111);

  final Color _primaryTextColor = Colors.black;
  final Color _secondaryTextColor = Colors.black54;
  final Color _iconColor = Colors.black;
  final double _borderRadius = 28.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _backgroundColor, // Set scaffold background to the vibrant green
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ), // Overall padding for the screen content
          child: Column(
            children: [
              // --- Top Icons/Illustrations ---
              Expanded(
                flex: 2, // Takes more space for the illustration
                child: Column(
                  children: [
                    // Top Row of Icons (Dollar, QR, Cards)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: _iconColor,
                          size: 30,
                        ),
                        Icon(Icons.qr_code_2, color: _iconColor, size: 30),
                        Icon(Icons.credit_card, color: _iconColor, size: 30),
                      ],
                    ),
                    const SizedBox(height: 30), // Spacing below top icons

                    // Main Illustration Area
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Large background circle (subtle visual element)
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.25),
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Main character illustration (using a placeholder network image)
                          // In a real app, you'd use an SVG asset or a custom painter
                          Image.network(
                            'https://i.imgur.com/your-illustration-placeholder.png', // Replace with your illustration URL
                            // For now, I'll use a placeholder that vaguely matches the style:

                            fit: BoxFit.contain,
                            width: 300,
                            height: 300,
                          ),
                          // Other small floating elements
                          Positioned(
                            left: 0,
                            bottom: 50,
                            child: Icon(
                              Icons.receipt_long,
                              color: _iconColor,
                              size: 40,
                            ), // Bills icon
                          ),
                          Positioned(
                            right: 0,
                            top: 50,
                            child: Icon(
                              Icons.monetization_on,
                              color: _iconColor,
                              size: 30,
                            ), // Dollar coin icon
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // --- Text Content ---
              Expanded(
                flex: 1, // Takes less space for text, pushing it up slightly
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Degital Banking\nMade for\nDigital Users",
                      style: GoogleFonts.aBeeZee(
                        // Using Poppins for a modern, bold look
                        fontSize: 35,
                        fontWeight: FontWeight.w900, // Extra bold
                        color: _primaryTextColor,
                        height: 1.1, // Line height adjustment
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Spend, earn and track financial activity",
                      style: GoogleFonts.inter(
                        // Using Inter for readability
                        fontSize: 16,
                        color: _secondaryTextColor,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40), // Spacing before buttons
                  ],
                ),
              ),

              // --- Bottom Navigation (Skip & Let's Start) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle skip logic
                      print("Skip pressed");
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: _primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60, // Fixed height for the button
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle "Let's Start" logic
                        print("Let's Start pressed");
                      },
                      icon: const Icon(Icons.arrow_forward_rounded,
                          color: Colors.white, size: 28), // White arrow
                      label: Text(
                        "Let's Start",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryTextColor, // Black button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_borderRadius),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28), // Adjust padding
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
