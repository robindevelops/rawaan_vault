import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AuthV1Screen extends StatefulWidget {
  const AuthV1Screen({super.key});

  @override
  State<AuthV1Screen> createState() => _AuthV1ScreenState();
}

class _AuthV1ScreenState extends State<AuthV1Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Blue Section
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                // Background Color
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4E56C0),
                    borderRadius: BorderRadius.only(),
                  ),
                  width: double.infinity,
                ),

                // Text and Tagline (centered)
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "RAWAAN",
                        style: GoogleFonts.fjallaOne(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Neighbors helping neighbors',
                        style: GoogleFonts.quicksand(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // House Image Positioned at Bottom
                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: Lottie.network(
                    'https://lottie.host/f30ddc3b-e333-499a-9a9e-3c3e17f21774/BwF1XMZklT.json',
                    fit: BoxFit.cover,
                    height: size.height * 0.30,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/houses.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          // Bottom White Section
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: GoogleFonts.fjallaOne(
                      fontSize: 27,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF4E56C0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  outlinedAuthButton(
                    text: "Continue with Google",
                    icon: Image.asset("assets/images/google.png", height: 20),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  authButton(
                    text: "Continue with Email",
                    icon: Icons.email_outlined,
                    onPressed: () {},
                  ),
                  Spacer(),
                  Text(
                    "By signing up you agree to our Terms & Conditions",
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "All rights reserved © Paros 2024",
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      color: Colors.black,
                    ),
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

Widget outlinedAuthButton({
  required String text,
  required Image icon,
  required VoidCallback onPressed,
}) {
  return OutlinedButton.icon(
    onPressed: onPressed,
    icon: icon,
    label: Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
    ),
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.black, width: 1.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      minimumSize: const Size(double.infinity, 52),
    ),
  );
}

Widget authButton({
  required String text,
  required IconData icon,
  required VoidCallback onPressed,
  Color backgroundColor = const Color(0xFF4E56C0),
  Color textColor = Colors.white,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: Icon(icon, color: textColor, size: 22),
    label: Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      elevation: 3,
      shadowColor: backgroundColor.withOpacity(0.3),
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}
