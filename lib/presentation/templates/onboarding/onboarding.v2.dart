import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingV2Screen extends StatefulWidget {
  const OnBoardingV2Screen({super.key});

  @override
  State<OnBoardingV2Screen> createState() => _OnBoardingV2ScreenState();
}

class _OnBoardingV2ScreenState extends State<OnBoardingV2Screen> {
  @override

  /// ------------------------------
  /// Rawwaan Onboarding Template
  /// ------------------------------
  /// Description:
  /// This is a reusable onboarding screen template for Rawwaan apps.
  /// Features include:
  /// - App logo with title
  /// - Network image with loading & error handling
  /// - Headline & subtitle text
  /// - Next & Skip buttons
  /// Designed with clean UI and Google Fonts for typography.
  /// ------------------------------
  ///
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo + Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bolt,
                    color: Colors.green,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Rawwaan",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Network Image with loading & error handling
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://img.freepik.com/free-vector/flat-creativity-concept-illustration_52683-64279.jpg',
                  height: 250,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 250,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 250,
                      child: Center(child: Icon(Icons.error, size: 40)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              // Headline
              Text(
                "Team Up For Success",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Subtitle
              Text(
                "Great things in business are never done by one person. They're done by a team of people.",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),

              // Next Button
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to your app's login screen
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBFFF60),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.green.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Skip Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: Skip onboarding
                },
                child: Text(
                  "Skip",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
