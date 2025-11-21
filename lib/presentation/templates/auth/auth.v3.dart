import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthV3Screen extends StatefulWidget {
  const AuthV3Screen({super.key});

  @override
  State<AuthV3Screen> createState() => _AuthV3ScreenState();
}

class _AuthV3ScreenState extends State<AuthV3Screen> {
  // Brand Color
  final Color primaryColor = const Color(0xFF4E56C0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Join Rawaan",
                style: GoogleFonts.fjallaOne(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Join our growing community to get prompt assistance and reliable services from neighbors.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    color: Colors.grey[700],
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 3. Primary Action (Email)
              SizedBox(
                width: double.infinity,
                child: authButton(
                  text: 'Sign in with Email',
                  icon: Icons.email_rounded,
                  onPressed: () {},
                  backgroundColor: primaryColor,
                ),
              ),

              const SizedBox(height: 30),

              // 4. Divider
              Row(
                children: [
                  Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Or continue with",
                      style: GoogleFonts.quicksand(
                        color: Colors.grey[500],
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1)),
                ],
              ),

              const SizedBox(height: 30),

              // 5. Social Actions
              SizedBox(
                width: double.infinity,
                child: outlinedAuthButton(
                  text: "Continue with Google",
                  // Using network image for demo purposes so it renders
                  icon: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png",
                    width: 24,
                    height: 24,
                    errorBuilder: (c, e, s) =>
                        const Icon(Icons.public, color: Colors.grey),
                  ),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: outlinedAuthButton(
                  text: "Continue with Phone",
                  icon: const Icon(Icons.phone_iphone_rounded,
                      color: Colors.black87, size: 24),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 40),

              // 6. Footer (Terms)
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.quicksand(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: "By continuing, you agree to our\n"),
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle Terms
                        },
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle Privacy
                        },
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Outlined Button Helper
  Widget outlinedAuthButton({
    required String text,
    required Widget icon,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        overlayColor: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  // 🔹 Filled Button Helper
  Widget authButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    required Color backgroundColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
