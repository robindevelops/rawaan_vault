import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV4Screen extends StatefulWidget {
  const WelcomeV4Screen({super.key});

  @override
  State<WelcomeV4Screen> createState() => _WelcomeV4ScreenState();
}

class _WelcomeV4ScreenState extends State<WelcomeV4Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
      // 🔴 Gradient Background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Deep Red Gradient for a strong, urgent, but clean feel
            colors: [Color(0xFFE63946), Color(0xFFB71C1C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  const Icon(Icons.bloodtype, size: 70, color: Colors.white),

                  const SizedBox(height: 24),

                  // 🌟 App Name (Urdu/Arabic text is beautiful!)
                  Text(
                    'اُمید', // Ummeed (Hope)
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold, // Added bold for more impact
                    ),
                  ),
                  const SizedBox(height: 8),

                  // ✨ Tagline
                  Text(
                    'Saving Lives Starts With You',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14, // Slightly increased size
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🔐 1. Primary Sign In Button (Already there)
                  AppElevatedButton(
                    text: 'Sign in',
                    onPressed: () {},
                  ),

                  const SizedBox(height: 16),

                  // 🧾 3. Create Account Button (Already there)
                  AppOutlinedButton(
                    text: 'Create an Account',
                    onPressed: () {},
                  ),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- Placeholder Button Widgets (Required for code execution) ---

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white, // Inverted color for visibility on dark red
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: const Color(0xFFE63946), // Use the primary red color
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppOutlinedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 2),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
