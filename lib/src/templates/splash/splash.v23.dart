import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SplashV23Screen extends StatefulWidget {
  const SplashV23Screen({super.key});

  @override
  State<SplashV23Screen> createState() => _SplashV23ScreenState();
}

class _SplashV23ScreenState extends State<SplashV23Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _layoutMode = 0; // 0=Minimalist, 1=Bold Typo, 2=Iconic

  @override
  void initState() {
    super.initState();

    // 1. Pick a completely different LAYOUT randomly
    _layoutMode = Random().nextInt(3);

    // 2. Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // 3. Start
    _controller.forward();

    // 4. Navigate
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We return a completely different Widget tree based on the random mode
    switch (_layoutMode) {
      case 0:
        return _buildLayoutMinimalist();
      case 1:
        return _buildLayoutBoldTypo();
      case 2:
        return _buildLayoutIconic();
      default:
        return _buildLayoutMinimalist();
    }
  }

  // --- LAYOUT 1: "The Minimalist" (Apple Style) ---
  // Small centered text, lots of whitespace, very clean.
  Widget _buildLayoutMinimalist() {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // Off-white
      body: Center(
        child: FadeTransition(
          opacity: CurvedAnimation(parent: _controller, curve: Curves.easeIn),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tiny, sharp Logo
              const Icon(Icons.circle, size: 12, color: Colors.black),
              const SizedBox(height: 15),
              // Thin, spaced out text
              Text(
                "rawaan", // Lowercase looks modern
                style: TextStyle(
                  fontFamily: 'Courier', // Monospaced font
                  fontSize: 26,
                  letterSpacing: 8.0, // Huge spacing
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- LAYOUT 2: "The Bold Typo" (Streetwear/Nike Style) ---
  // Inverted colors (Black BG), Huge text, No Icon.
  Widget _buildLayoutBoldTypo() {
    final slideUp =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo),
    );

    return Scaffold(
      backgroundColor: Colors.black, // Dark Mode
      body: Stack(
        children: [
          Center(
            child: SlideTransition(
              position: slideUp,
              child: FadeTransition(
                opacity: _controller,
                child: const Text(
                  "RAWAAN.",
                  style: TextStyle(
                    fontSize: 48, // Massive text
                    fontWeight: FontWeight.w900, // Extra Bold
                    color: Colors.white,
                    letterSpacing: -2.0, // Tight spacing
                  ),
                ),
              ),
            ),
          ),
          // Subtle copyright at bottom
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: FadeTransition(
                opacity: _controller,
                child: Text(
                  "EST. 2024",
                  style: TextStyle(color: Colors.grey[800], fontSize: 10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // --- LAYOUT 3: "The Iconic" (Tech Style) ---
  // Logo and Text side-by-side (Row), clean modern blue.
  Widget _buildLayoutIconic() {
    final scale =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: scale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.auto_awesome,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(width: 15),
              const Text(
                "Rawaan",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- HOME SCREEN ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Welcome Home")));
  }
}
