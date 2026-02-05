import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome Screen V20 - Music/Festival Theme
/// Features: Vibrant gradients, bold typography, party vibes
class WelcomeV20Screen extends StatefulWidget {
  const WelcomeV20Screen({super.key});

  @override
  State<WelcomeV20Screen> createState() => _WelcomeV20ScreenState();
}

class _WelcomeV20ScreenState extends State<WelcomeV20Screen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotateController;

  static const Color hotPink = Color(0xFFFF006E);
  static const Color electricPurple = Color(0xFF8338EC);
  static const Color sunYellow = Color(0xFFFFBE0B);
  static const Color oceanBlue = Color(0xFF3A86FF);

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A0533),
              Color(0xFF2D1B4E),
              Color(0xFF1A0533),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated background circles
            ..._buildBackgroundCircles(),

            // Main content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    // Top bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [hotPink, electricPurple],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "LIVE NOW",
                            style: GoogleFonts.spaceGrotesk(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Main title with gradient
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [sunYellow, hotPink, electricPurple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        "PULSE",
                        style: GoogleFonts.monoton(
                          color: Colors.white,
                          fontSize: 64,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                    Text(
                      "FESTIVAL",
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 16,
                      ),
                    ),
                    Text(
                      "2 0 2 6",
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 8,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Sound wave visualization
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(15, (index) {
                              final delay = (index - 7).abs() / 7;
                              final height = 20 +
                                  (math.sin((_pulseController.value *
                                                  2 *
                                                  math.pi) +
                                              (index * 0.5)) +
                                          1) *
                                      25;
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                width: 4,
                                height: height,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      hotPink,
                                      electricPurple,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    // Artist lineup preview
                    Text(
                      "FEATURING",
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildArtistChip("DJ NOVA"),
                        _buildArtistChip("SYNTHWAVE"),
                        _buildArtistChip("BASS DROP"),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // CTA Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [hotPink, electricPurple],
                              ),
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: hotPink.withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              child: Text(
                                "GET TICKETS",
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackgroundCircles() {
    return [
      Positioned(
        top: -100,
        right: -100,
        child: AnimatedBuilder(
          animation: _rotateController,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotateController.value * 2 * math.pi,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      electricPurple.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 100,
        left: -80,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                hotPink.withOpacity(0.2),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 200,
        left: 50,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                oceanBlue.withOpacity(0.2),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildArtistChip(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: GoogleFonts.spaceGrotesk(
          color: Colors.white.withOpacity(0.8),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
