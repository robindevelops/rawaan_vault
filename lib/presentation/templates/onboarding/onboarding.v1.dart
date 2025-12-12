import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingV1Screen extends StatefulWidget {
  const OnBoardingV1Screen({super.key});

  @override
  State<OnBoardingV1Screen> createState() => _OnBoardingV1ScreenState();
}

class _OnBoardingV1ScreenState extends State<OnBoardingV1Screen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Colors - Define them here for easy changing
  final Color _accentColor = const Color(0xFFCFFF00);
  final Color _primaryColor = Colors.black;
  final Color _backgroundColor = Colors.white;

  // Onboarding Data
  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": "assets/images/welcome.png",
      "fallback_icon": Icons.celebration_outlined, // Fallback if image fails
      "title": "Welcome to AppName",
      "subtitle":
          "Your new favorite way to manage tasks, track progress, and achieve goals effortlessly.",
    },
    {
      "image": "assets/images/feature1.png",
      "fallback_icon": Icons.layers_outlined,
      "title": "Organize Smartly",
      "subtitle":
          "Create custom workspaces and categorize your life with our intuitive tagging system.",
    },
    {
      "image": "assets/images/feature2.png",
      "fallback_icon": Icons.rocket_launch_outlined,
      "title": "Boost Productivity",
      "subtitle":
          "Get insights into your habits and improve your workflow with real-time analytics.",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to Home/Login
      print("Navigate to Home");
    }
  }

  void _skip() {
    _pageController.jumpToPage(onboardingData.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    // Responsive width calculation
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // =========================
            // 1️⃣ TOP BAR (SKIP BUTTON)
            // =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Empty container to balance the row if needed, or back button
                  const SizedBox(width: 40),
                  if (_currentIndex < onboardingData.length - 1)
                    TextButton(
                      onPressed: _skip,
                      child: Text(
                        "Skip",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // =========================
            // 2️⃣ CAROUSEL CONTENT
            // =========================
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() {
                  _currentIndex = index;
                }),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image Handling with Safety Fallback
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                // Renders an icon if image path is invalid
                                return Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    item['fallback_icon'],
                                    size: 80,
                                    color: _primaryColor,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Title Area
                        Transform.rotate(
                          angle: -0.02, // Subtle rotation
                          child: Container(
                            decoration: BoxDecoration(
                              color: _accentColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(
                              item['title']!,
                              style: GoogleFonts.poppins(
                                color: _primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Subtitle
                        Text(
                          item['subtitle']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  );
                },
              ),
            ),

            // =========================
            // 3️⃣ CONTROLS AREA
            // =========================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? _primaryColor
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Primary Button (Dynamic Text)
                  SizedBox(
                    width: width, // Takes full width minus padding
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        elevation: 4,
                        shadowColor: _primaryColor.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentIndex == onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Secondary Button (Login)
                  // Only show "Already have an account" on the last page?
                  // Or show it always. Here we show it always but style it subtly.
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to Login
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      width: width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // cleaner look
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "Log In",
                              style: GoogleFonts.poppins(
                                color: _primaryColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
