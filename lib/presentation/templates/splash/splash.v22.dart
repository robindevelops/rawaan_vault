import 'dart:async';
import 'dart:math';
import 'dart:ui'; // Required for the Blur effect
import 'package:flutter/material.dart';

class SplashV22Screen extends StatefulWidget {
  const SplashV22Screen({super.key});

  @override
  State<SplashV22Screen> createState() => _SplashV22ScreenState();
}

class _SplashV22ScreenState extends State<SplashV22Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _animMode = 0; // 0 = Cinematic Zoom, 1 = Blur Focus, 2 = Elastic Up

  @override
  void initState() {
    super.initState();

    // 1. Pick a random slick animation style
    _animMode = Random().nextInt(3);

    // 2. Controller (2 seconds for a slow, premium feel)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 3. Start
    _controller.forward();

    // 4. Navigate
    Timer(const Duration(milliseconds: 3500), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const HomeScreen()),
      // );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Defines the dark, slick background
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // "Midnight Slate" color
      body: Stack(
        children: [
          // Optional: Subtle background gradient for depth
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  const Color(0xFF1E293B), // Slightly lighter center
                  const Color(0xFF0F172A), // Dark edges
                ],
              ),
            ),
          ),

          // The Animated Content
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return _applyRandomAnimation(child!);
              },
              // The Logo & Text Design
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Slick Logo
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withOpacity(0.05), // Glassmorphism effect
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: const Icon(
                      Icons.near_me_rounded, // A sharp, directional icon
                      size: 60,
                      color: Color(0xFF38BDF8), // Neon Sky Blue
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Slick Typography
                  const Text(
                    "RAWAAN",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 6.0, // Wide spacing = Premium look
                      fontFamily: 'Courier', // Or your custom font
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Loading Bar (Purely aesthetic)
                  Container(
                    width: 40,
                    height: 2,
                    decoration: BoxDecoration(
                      color: const Color(0xFF38BDF8),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _applyRandomAnimation(Widget child) {
    switch (_animMode) {
      case 0: // STYLE 1: CINEMATIC ZOOM OUT
        // Starts slightly big and fades in while zooming out to normal size
        final scale = Tween<double>(begin: 1.5, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
        );
        final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6)),
        );
        return Opacity(
          opacity: fade.value,
          child: Transform.scale(scale: scale.value, child: child),
        );

      case 1: // STYLE 2: BLUR FOCUS (Very Modern/Apple)
        // Starts blurry and becomes sharp
        final blurVal = Tween<double>(begin: 10.0, end: 0.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );
        final fadeVal =
            Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

        return ImageFiltered(
          imageFilter:
              ImageFilter.blur(sigmaX: blurVal.value, sigmaY: blurVal.value),
          child: Opacity(opacity: fadeVal.value, child: child),
        );

      case 2: // STYLE 3: ELASTIC SLIDE UP
        // Slides up with a slight "snap" at the end
        final slide =
            Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
                .animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
        );
        final fadeSlide = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
        );
        return FadeTransition(
          opacity: fadeSlide,
          child: SlideTransition(position: slide, child: child),
        );

      default:
        return child;
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(child: Text("Home")),
    );
  }
}
