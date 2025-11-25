import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeV8Screen extends StatefulWidget {
  const WelcomeV8Screen({super.key});

  @override
  State<WelcomeV8Screen> createState() => _WelcomeV8ScreenState();
}

class _WelcomeV8ScreenState extends State<WelcomeV8Screen> {
  final Color primaryNavy = const Color(0xFF0D47A1);
  final Color accentGold = const Color(0xFFFFCC00);
  final Color deepBlue = const Color(0xFF013A63);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryNavy,
              deepBlue,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                // Government-style emblem / icon
                Icon(
                  Icons.how_to_vote,
                  size: 82,
                  color: accentGold,
                ),

                const SizedBox(height: 20),

                // Year
                Text(
                  "2025 GENERAL ELECTIONS",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                  ),
                ),

                // Thin premium divider
                Container(
                  width: 85,
                  height: 3,
                  margin: const EdgeInsets.only(top: 6, bottom: 22),
                  decoration: BoxDecoration(
                    color: accentGold,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // Primary Title (Government strong serif)
                Text("It's Time to Cast Your Vote".toUpperCase(),
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: accentGold,
                    )),

                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "Welcome to Pakistan's official voting portal.",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 0.8,
                    height: 1.4,
                  ),
                ),

                const Spacer(),

                // Primary Button – More premium UI
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      backgroundColor: accentGold,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: const Text("VOTE NOW"),
                  ),
                ),

                const SizedBox(height: 16),

                // Secondary Action
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Explore Candidates",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
