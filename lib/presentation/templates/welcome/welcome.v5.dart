import 'package:flutter/material.dart';

class WelcomeV5Screen extends StatelessWidget {
  const WelcomeV5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the screen height for positioning
    final screenHeight = MediaQuery.of(context).size.height;
    final Paint outlinePaint = Paint()
      ..style = PaintingStyle
          .stroke // Crucial for outline effect (stroke only, no fill)
      ..strokeWidth = 1.0 // Thickness of the border/outline
      ..color =
          Colors.white.withOpacity(0.15); // Color and opacity of the outline

    return Scaffold(
      body: Container(
        // 1. Background Gradient Container

        child: Stack(
          children: [
            // 2. Overlay Image/Visual Element
            // We use an empty container here to represent the space and dimensions
            // of the dark, semi-transparent image layer shown in the screenshot.
            // In a real app, you would use an Image widget with a specific asset.
            Image.network(
              "https://www.aestheticwalldecor.com/cdn/shop/files/S2ec2a10377694b998b458b7118b04a5dD.webp?v=1695704606&width=1445",
              fit: BoxFit.cover,
              height: screenHeight,
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.8,
                child: Container(color: const Color.fromARGB(255, 32, 33, 32)),
              ),
            ),

            Text(
              // Repeat the text multiple times to ensure horizontal coverage
              'NIKE NFT NIKE NFT NIKE NFT NIKE NFT',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 90,
                fontWeight: FontWeight.w900,
                letterSpacing: -5,
                foreground: outlinePaint,
              ),
            ),

            // 3. Layered Text and UI Elements
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  // Aligns content to the start (top) and center (horizontal)
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Status Bar Placeholder (9:41, Signal) - This is handled by the OS/Scaffold
                    // We'll add padding to push down the content slightly
                    SizedBox(height: screenHeight * 0.05),

                    // NFT Logo with Nike Swoosh

                    _buildNftLogo(),

                    // Space for the central figure image (occupies a large central area)
                    SizedBox(height: screenHeight * 0.45),

                    // Main Promotional Text

// **2. The Outline
                    Text(
                      'YOUR BEST\nNFT MarketPlace'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily:
                            'Roboto', // Use a common font that resembles the design
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w900, // Very bold
                        height: 1.1,
                        letterSpacing: -0.5,
                      ),
                    ),

                    // Spacer to push the button to the bottom
                    const Spacer(),

                    // INICIAR Button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: _buildIniciarButton(context),
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

  // Helper method for the NFT Logo
  Widget _buildNftLogo() {
    return Column(
      children: [
        const Text(
          'NFT™',
          style: TextStyle(
            fontFamily: 'Futura', // A geometric, bold font
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
        // Nike Swoosh - Use a simple box as a placeholder for the actual swoosh image asset
        Container(
          width: 50,
          height: 25,
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ), // This is a placeholder for the Nike swoosh icon
        ),
      ],
    );
  }

  // Helper method for the INICIAR Button
  Widget _buildIniciarButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          // Action when button is pressed
          print('Get Started');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(27.5), // Half of height for pill shape
          ),
          elevation: 0,
        ),
        child: const Text(
          'GET STARTED',
          style: TextStyle(
            color: Colors.black, // Text is black on the white button
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
