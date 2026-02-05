import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Onboarding V11 - Warm Sunset Welcome
/// Cozy warm tones with friendly aesthetic
class OnBoardingV11Screen extends StatefulWidget {
  const OnBoardingV11Screen({super.key});

  @override
  State<OnBoardingV11Screen> createState() => _OnBoardingV11ScreenState();
}

class _OnBoardingV11ScreenState extends State<OnBoardingV11Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Color(0xFFFFF5E6),
              Color(0xFFFFE4CC),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top section
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9F43),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.wb_sunny,
                              color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Rawaan',
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF5D4E37),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Skip',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5D4E37).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 1),

              // Center content
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF9F43).withOpacity(0.2),
                      blurRadius: 40,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9F43).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF9F43), Color(0xFFFFB067)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite,
                          color: Colors.white, size: 48),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Title
              Text(
                'Hello, Friend!',
                style: GoogleFonts.quicksand(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF5D4E37),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Warmly welcome you',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFFFF9F43),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Join our community and experience the warmth of connection. Every moment shared is a memory treasured.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF5D4E37).withOpacity(0.7),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(flex: 2),

              // Bottom section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ScaleTransition(
                  scale: CurvedAnimation(
                      parent: _controller, curve: Curves.elasticOut),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF9F43), Color(0xFFFFB067)],
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF9F43).withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(28),
                        onTap: () {},
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Started',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded,
                                  color: Colors.white, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Watermark
              Opacity(
                opacity: 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite,
                        size: 12, color: Color(0xFFFF9F43)),
                    const SizedBox(width: 6),
                    Text(
                      'Made with love by Rawaan',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF9F43),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
