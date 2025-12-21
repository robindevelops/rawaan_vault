import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV14Screen extends StatefulWidget {
  const WelcomeV14Screen({super.key});

  @override
  State<WelcomeV14Screen> createState() => _WelcomeV14ScreenState();
}

class _WelcomeV14ScreenState extends State<WelcomeV14Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // Hero Image with gradient fade
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.55,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                ],
                stops: [0.0, 0.2, 0.6, 1.0],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: Image.network(
                "https://framerusercontent.com/images/yIYS6UJJ1tCVunyaMSasf0ore0s.png?width=3556&height=2000",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          // Skip button
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            right: 16,
            child: Text(
              'Skip',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          // Bottom content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  const Icon(
                    FontAwesomeIcons.asterisk,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 10),

                  // App name
                  Text(
                    "perplexity",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Apple button
                  _AuthButton(
                    icon: FontAwesomeIcons.apple,
                    text: 'Continue with Apple',
                    isOutlined: true,
                  ),
                  const SizedBox(height: 12),

                  // Google button
                  _AuthButton(
                    icon: FontAwesomeIcons.google,
                    text: 'Continue with Google',
                    isOutlined: true,
                    iconColor: Colors.white,
                  ),
                  const SizedBox(height: 12),

                  // Email button
                  _AuthButton(
                    text: 'Continue with email',
                    isOutlined: false,
                  ),
                  const SizedBox(height: 24),

                  // Footer links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Privacy policy",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF666666),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        "Terms of service",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF666666),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool isOutlined;
  final Color? iconColor;

  const _AuthButton({
    this.icon,
    required this.text,
    required this.isOutlined,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(26),
        border: isOutlined
            ? Border.all(color: Colors.white.withOpacity(0.2), width: 1)
            : null,
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.white, size: 18),
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
