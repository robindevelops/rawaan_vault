import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV10Screen extends StatefulWidget {
  const WelcomeV10Screen({super.key});

  @override
  State<WelcomeV10Screen> createState() => _WelcomeV10ScreenState();
}

class _WelcomeV10ScreenState extends State<WelcomeV10Screen>
    with TickerProviderStateMixin {
  // --- Branding Colors ---
  static const Color mcdYellow = Color(0xFFFFC72C);
  static const Color mcdRed = Color(0xFFDA291C);
  static const Color richBlack = Color(0xFF151515);

  late AnimationController _controller;

  // Animations
  late Animation<double> _scaleLogo;
  late Animation<double> _widthDivider;
  late Animation<Offset> _slideText;
  late Animation<double> _fadeButton;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // 1. Logo Bounces In (0ms - 800ms)
    _scaleLogo = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
      ),
    );

    // 2. Divider Expands Width (400ms - 900ms)
    _widthDivider = Tween<double>(begin: 0.0, end: 120.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    // 3. Text Slides Up (600ms - 1100ms)
    _slideText =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    // 4. Button Fades In (1000ms - 1500ms)
    _fadeButton = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start Animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcdYellow,
      body: Stack(
        children: [
          // Background Pattern (Optional subtle circle for depth)
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // --- TOP SECTION: BRANDING ---
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Logo
                      ScaleTransition(
                        scale: _scaleLogo,
                        child: Text(
                          'M',
                          style: GoogleFonts.aboreto(
                            // Kept your font choice
                            color: mcdRed,
                            fontSize: 140,
                            fontWeight: FontWeight.w900,
                            height: 0.9,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(5, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Animated Divider
                      AnimatedBuilder(
                        animation: _widthDivider,
                        builder: (context, child) {
                          return Container(
                            width: _widthDivider.value,
                            height: 4,
                            decoration: BoxDecoration(
                              color: mcdRed,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      // Animated Text Area
                      SlideTransition(
                        position: _slideText,
                        child: AnimatedOpacity(
                          opacity: 1.0, // Used with Slide for effect
                          duration: const Duration(milliseconds: 500),
                          child: Column(
                            children: [
                              Text(
                                "ARE YOU HUNGRY?",
                                style: GoogleFonts.poppins(
                                  // Switched to Poppins for readability
                                  color: richBlack,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Your favorites, delivered hot & fresh.",
                                style: GoogleFonts.poppins(
                                  color: richBlack.withOpacity(0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // --- BOTTOM SECTION: ACTION ---
                Expanded(
                  flex: 1,
                  child: FadeTransition(
                    opacity: _fadeButton,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Modern Hero Button
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: richBlack,
                                foregroundColor: Colors.white,
                                elevation: 8,
                                shadowColor: Colors.black38,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ORDER NOW',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward_rounded,
                                      size: 20),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
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
