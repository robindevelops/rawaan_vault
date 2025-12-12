import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingV6Screen extends StatefulWidget {
  const OnboardingV6Screen({super.key});

  @override
  State<OnboardingV6Screen> createState() => _OnboardingV6ScreenState();
}

class _OnboardingV6ScreenState extends State<OnboardingV6Screen> {
  @override
  Widget build(BuildContext context) {
    // Determine screen size for responsive sizing
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDFBF7), // Warm off-white (Cream)
              Color(0xFFE8EAF6), // Very light cool blue
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://github.com/aroobacodes/flutter_crumble/blob/main/crumble_project/lib/images/crumble.png?raw=true',
                  height: size.height * 0.45,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: size.height * 0.35,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      FontAwesomeIcons.exclamation,
                      size: 100,
                      color: Colors.grey,
                    );
                  },
                ),
              ),

              const Spacer(flex: 1),

              // Typography
              Text(
                'Call me Cookiyan..',
                style: GoogleFonts.permanentMarker(
                  fontSize: 28,
                  color: const Color(0xFF070373),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'kyunke zindagi tou meri bhi cooked hai',
                style: GoogleFonts.kalam(
                  fontSize: 15,
                  color: const Color(0xFF070373).withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(flex: 3),

              // Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor: const Color(0xFF021167),
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: const Color(0xFF021167).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started'.toUpperCase(),
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // -----------------------------------------------------
              // ✨ BEAUTIFUL WATERMARK ADDED HERE ✨
              // -----------------------------------------------------
              Opacity(
                opacity: 0.6, // Kept subtle so it doesn't fight for attention
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FontAwesomeIcons.code,
                        size: 12, color: Color(0xFF021167)),
                    const SizedBox(width: 6),
                    Text(
                      'Concept & Dev by Arooba'.toUpperCase(),
                      style: GoogleFonts.cabin(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF021167),
                      ),
                    ),
                  ],
                ),
              ),
              // -----------------------------------------------------

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
