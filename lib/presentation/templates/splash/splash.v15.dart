import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashV15Screen extends StatefulWidget {
  const SplashV15Screen({super.key});

  @override
  State<SplashV15Screen> createState() => _SplashV15ScreenState();
}

class _SplashV15ScreenState extends State<SplashV15Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animations
  late Animation<double> _circleScaleAnim;
  late Animation<double> _iconRevealAnim;
  late Animation<Offset> _textSlideAnim;
  late Animation<double> _textFadeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // 1. The Circle Morph:
    // It goes 0 -> 30 (Fill Screen) -> 1 (Shrink to Logo Size)
    // This sequence creates the "Explode then Shrink" effect
    _circleScaleAnim = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 30.0)
            .chain(CurveTween(curve: Curves.easeOut)), // Fill screen fast
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 30.0, end: 1.0).chain(
            CurveTween(curve: Curves.elasticOut)), // Bounce back to icon size
        weight: 60,
      ),
    ]).animate(_controller);

    // 2. Icon Reveal (Fade in the actual Icon inside the circle)
    // Happens only after the circle starts shrinking back
    _iconRevealAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8, curve: Curves.easeIn),
      ),
    );

    // 3. Text Slide Up
    _textSlideAnim = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    // 4. Text Fade
    _textFadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });

    // Mock Nav
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) debugPrint("Home");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // COLOR PALETTE
    const Color brandGreen = Color(0xFF06C167); // The Main Green
    const Color lightMint =
        Color.fromARGB(255, 231, 250, 241); // The "Same shade but light"
    const Color darkForest =
        Color(0xFF02361C); // Text color (High contrast green)

    return Scaffold(
      backgroundColor: lightMint, // The final light background
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ------------------------------------------------
                // 1. THE MORPHING CIRCLE
                // ------------------------------------------------
                Transform.scale(
                  scale: _circleScaleAnim.value,
                  child: Container(
                    width: 80, // Final Icon Size
                    height: 80,
                    decoration: const BoxDecoration(
                      color: brandGreen,
                      shape: BoxShape.circle,
                    ),
                    // The Icon inside fades in as the circle shrinks
                    child: Opacity(
                      opacity: _iconRevealAnim.value,
                      child: const Icon(
                        Icons.near_me_rounded,
                        color: Colors.white,
                        size: 45, // Scale is 1.0 here relative to container
                      ),
                    ),
                  ),
                ),

                // Spacing that only appears visually as text slides in
                const SizedBox(height: 20),

                // ------------------------------------------------
                // 2. THE TEXT (Deep Green for Contrast)
                // ------------------------------------------------
                FadeTransition(
                  opacity: _textFadeAnim,
                  child: SlideTransition(
                    position: _textSlideAnim,
                    child: Column(
                      children: [
                        Text(
                          "RAWAAN",
                          style: GoogleFonts.cairo(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // White text on Green
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          "Start your journey",
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: darkForest.withOpacity(0.9),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
