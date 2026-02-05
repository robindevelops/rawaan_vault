import 'dart:async';
import 'package:flutter/material.dart';

class SplashV24Screen extends StatefulWidget {
  const SplashV24Screen({super.key});

  @override
  State<SplashV24Screen> createState() => _SplashV24ScreenState();
}

class _SplashV24ScreenState extends State<SplashV24Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _spacingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // 2 seconds animation
    );

    // 1. Text fades in
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // 2. Letters start far apart (20px) and slide together (2px)
    _spacingAnimation = Tween<double>(begin: 20.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Navigate to your next screen here
      debugPrint("Navigating to Home...");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Pure clean background
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  // The Main Text
                  Text(
                    "Rawaan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w300, // Thin, elegant font
                      letterSpacing:
                          _spacingAnimation.value, // The magic movement
                    ),
                  ),
                  // The Creative "Dot" Accent
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent, // Pop of color
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orangeAccent.withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
