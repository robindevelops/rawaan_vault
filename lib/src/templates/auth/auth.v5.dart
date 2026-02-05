import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthV5Screen extends StatefulWidget {
  const AuthV5Screen({super.key});

  @override
  State<AuthV5Screen> createState() => _AuthV5ScreenState();
}

class _AuthV5ScreenState extends State<AuthV5Screen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  // --- Minimalist Palette ---
  final Color kBg = const Color(0xFFFFFFFF);
  final Color kTextPrimary = const Color(0xFF1A1A1A);
  final Color kTextSecondary = const Color(0xFF8A8A8A);
  final Color kInputBg = const Color(0xFFF7F7F7);
  final Color kAccent = const Color(0xFF1A1A1A); // Stark Black for impact

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Screen Height for responsiveness
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBg,
      body: Stack(
        children: [
          // 1. Creative Ambient Background
          Positioned(
            top: -100,
            right: -50,
            child: _buildBlurBlob(const Color(0xFFFFD1C1), 300), // Soft Peach
          ),
          Positioned(
            bottom: 100,
            left: -80,
            child:
                _buildBlurBlob(const Color(0xFFC1D4FF), 350), // Soft Periwinkle
          ),

          // 2. Main Content
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // Creative Header
                  FadeIn(
                    delay: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: kTextPrimary,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Icon(Icons.waves,
                              color: Colors.white, size: 28),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Hello,Welcome Back.',
                          style: GoogleFonts.cabin(
                            fontSize: 30,
                            height: 1.1,
                            fontWeight: FontWeight.w600,
                            color: kTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Inputs
                  FadeIn(
                    delay: 400,
                    child: Column(
                      children: [
                        _buildMinimalInput(
                          controller: _phoneController,
                          hint: 'Phone Number',
                          icon: Icons.phone_outlined,
                        ),
                        const SizedBox(height: 20),
                        _buildMinimalInput(
                          controller: _passwordController,
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Forgot Password
                  FadeIn(
                    delay: 500,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.lato(
                          color: kTextPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Action Button
                  FadeIn(
                    delay: 600,
                    child: _buildBlackButton(),
                  ),

                  const SizedBox(height: 40),

                  // Minimal Socials
                  FadeIn(
                    delay: 700,
                    child: Center(child: _buildMinimalSocials()),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildBlurBlob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.4),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _buildMinimalInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: kInputBg,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextField(
        controller: controller,
        obscureText: isPassword && _obscurePassword,
        style: GoogleFonts.lato(
            color: kTextPrimary, fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: GoogleFonts.lato(color: kTextSecondary),
          icon: Icon(icon, color: kTextSecondary, size: 20),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  child: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: kTextSecondary,
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildBlackButton() {
    return GestureDetector(
      onTap: () => setState(() => _isLoading = true),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kTextPrimary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kTextPrimary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.arrow_forward_rounded,
                      color: Colors.white, size: 20),
                ],
              ),
      ),
    );
  }

  Widget _buildMinimalSocials() {
    return Column(
      children: [
        Text(
          "Or connect with",
          style: GoogleFonts.lato(color: kTextSecondary, fontSize: 14),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialCircle(FontAwesomeIcons.google, Colors.red),
            const SizedBox(width: 20),
            _socialCircle(FontAwesomeIcons.apple, Colors.black),
            const SizedBox(width: 20),
            _socialCircle(FontAwesomeIcons.facebookF, Colors.blue.shade800),
          ],
        ),
      ],
    );
  }

  Widget _socialCircle(IconData icon, Color color) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: FaIcon(icon, color: color, size: 20),
      ),
    );
  }
}

// --- Simple Animation Helper ---
class FadeIn extends StatefulWidget {
  final Widget child;
  final int delay;

  const FadeIn({super.key, required this.child, required this.delay});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
    _translate =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _translate,
      child: FadeTransition(
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }
}
