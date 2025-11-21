import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingV3Screen extends StatelessWidget {
  const OnBoardingV3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors extracted from the design
    final Color darkNavy = const Color.fromARGB(255, 46, 46, 129);
    final Color lightPurpleBg = const Color(0xFFEBEBFF);
    final Color cardBg = const Color(0xFFBFAEFF);

    return Scaffold(
      backgroundColor: lightPurpleBg,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'CircleUp',
                style: GoogleFonts.abrilFatface(
                  fontSize: 30,
                  height: 1.1,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                  color: darkNavy,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: cardBg,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1622979135225-d2ba269fb1a2?q=80&w=1000&auto=format&fit=crop',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // Floating Badge: "VR parties" (Right)
                            Positioned(
                              right: 10,
                              top: 80,
                              child: _buildFloatingBadge(
                                text: "VR parties",
                                rotate: 0.05,
                              ),
                            ),

                            // Floating Badge: "Closer than ever" (Left)
                            Positioned(
                              left: 0,
                              bottom: 100,
                              child: _buildFloatingBadge(
                                text: "Closer than ever",
                                rotate: -0.05,
                              ),
                            ),

                            // Floating Badge: Icon/Emoji (Top Left)
                            Positioned(
                              left: 20,
                              top: 60,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "🎉",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Pagination Dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(isActive: false),
                          _buildDot(isActive: true, isLong: true),
                          _buildDot(isActive: false),
                          _buildDot(isActive: false),
                          _buildDot(isActive: false),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Headline
                      Text(
                        'Utilize new\nopportunities',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.abrilFatface(
                          fontSize: 38,
                          height: 1.1,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: darkNavy,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Add animated 3D objects, filters, and special effects to your photos and videos',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 13,
                            height: 1.4,
                            color: darkNavy.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            // 3. Bottom Buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Column(
                children: [
                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkNavy,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Log In Text Button
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: darkNavy,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingBadge({required String text, double rotate = 0.0}) {
    return Transform.rotate(
      angle: rotate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF0A0A35),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildDot({bool isActive = false, bool isLong = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isLong ? 24 : 6,
      height: 6,
      decoration: BoxDecoration(
        color:
            isActive ? const Color(0xFF0A0A35) : Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
