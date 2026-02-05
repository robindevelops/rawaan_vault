import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnBoardingV5Screen extends StatefulWidget {
  const OnBoardingV5Screen({super.key});

  @override
  State<OnBoardingV5Screen> createState() => _OnBoardingV5ScreenState();
}

class _OnBoardingV5ScreenState extends State<OnBoardingV5Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                        "Rawaan",
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
                          color: Colors.white,
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
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Welcome to rawwan!',
                        style: GoogleFonts.fjallaOne(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Paros is a friendly neighborhood app that helps people come together, share their needs, and offer help when it’s needed most. Whether someone nearby has lost something, needs a quick favor, or just wants to lend a hand, Paros makes it simple to connect. It’s more than just a social app — it’s a platform built on kindness, trust, and real human connection. By using Paros, you become part of a caring network where every small act of help strengthens your community and makes your neighborhood a better place for everyone.",
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            height: 1.6,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      ScaleTransition(
                        scale: CurvedAnimation(
                          parent: _controller,
                          curve: Curves.elasticOut,
                        ),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4E56C0),
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(Icons.arrow_forward_rounded,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                  Positioned(
                    bottom: 90,
                    left: 0,
                    right: 0,
                    child: Lottie.network(
                      'https://lottie.host/f30ddc3b-e333-499a-9a9e-3c3e17f21774/BwF1XMZklT.json',
                      fit: BoxFit.cover,
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
