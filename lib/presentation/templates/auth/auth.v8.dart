import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthV8Screen extends StatefulWidget {
  const AuthV8Screen({super.key});

  @override
  State<AuthV8Screen> createState() => _AuthV8ScreenState();
}

class _AuthV8ScreenState extends State<AuthV8Screen>
    with SingleTickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // Animation Controller for the subtle background movement
  late AnimationController _bgController;
  late Animation<Alignment> _bgAnimation;

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // --- Premium Dark Palette ---
  static const Color kBgDark = Color(0xFF050505); // Deeper than pure black
  static const Color kAccent = Color(0xFFFFFFFF);
  static const Color kGlassBorder = Color(0xFF333333);
  static const Color kTextGray = Color(0xFF888888);

  @override
  void initState() {
    super.initState();
    // Background breathing animation
    _bgController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _bgAnimation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(
      parent: _bgController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBgDark,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              // 1. Ambient Background Effects
              _buildAnimatedBackground(),

              // 2. Main Content
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),

                        // Animated Logo
                        _buildHeroLogo(),

                        const SizedBox(height: 20),

                        // Glass Input Fields
                        _buildGlassInput(
                          controller: _phoneController,
                          hint: "Phone Number",
                          icon: Icons.phone_android_rounded,
                        ),

                        const SizedBox(height: 20),

                        _buildGlassInput(
                          controller: _passwordController,
                          hint: "Password",
                          icon: Icons.lock_outline_rounded,
                          isPassword: true,
                        ),

                        const SizedBox(height: 16),

                        // Minimal Forgot Btn
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.manrope(
                              color: kTextGray,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Action Button
                        _buildPrimaryButton(),

                        const SizedBox(height: 50),

                        // Minimal Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white10)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "OR",
                                style: GoogleFonts.manrope(
                                    color: Colors.white24,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.white10)),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Social Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon(FontAwesomeIcons.google),
                            const SizedBox(width: 24),
                            _buildSocialIcon(FontAwesomeIcons.apple),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Sign Up Link
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.manrope(
                                color: kTextGray, fontSize: 14),
                            children: [
                              const TextSpan(text: "New to Rawaan? "),
                              TextSpan(
                                text: "Join now",
                                style: GoogleFonts.manrope(
                                  color: kAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _bgAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _bgAnimation.value,
              end: Alignment.bottomLeft,
              colors: [
                const Color(0xFF050505),
                const Color(0xFF0A0A12), // Very subtle blue-black
                const Color(0xFF050505),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeroLogo() {
    return Column(
      children: [
        // Abstract logo mark
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 1),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white10, Colors.transparent],
            ),
          ),
          child: const Center(
            child: Icon(Icons.north_east, color: Colors.white, size: 28),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "RAWAAN",
          style: GoogleFonts.syne(
            // Trendy, wide display font
            color: kAccent,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Journey begins here.",
          style: GoogleFonts.manrope(
            color: kTextGray,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildGlassInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05), // 5% opacity white
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword && !_isPasswordVisible,
            style: GoogleFonts.manrope(color: Colors.white, fontSize: 16),
            cursorColor: kAccent,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white38, size: 20),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white38,
                        size: 20,
                      ),
                      onPressed: () => setState(
                          () => _isPasswordVisible = !_isPasswordVisible),
                    )
                  : null,
              hintText: hint,
              hintStyle: GoogleFonts.manrope(color: Colors.white24),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton() {
    return GestureDetector(
      onTap: () {
        setState(() => _isLoading = true);
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) setState(() => _isLoading = false);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kAccent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (!_isLoading)
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: _isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                      color: Colors.black, strokeWidth: 2),
                )
              : Text(
                  "CONTINUE",
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Center(
        child: FaIcon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
