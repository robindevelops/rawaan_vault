import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingV4Screen extends StatefulWidget {
  const OnBoardingV4Screen({super.key});

  @override
  State<OnBoardingV4Screen> createState() => _OnBoardingV4ScreenState();
}

class _OnBoardingV4ScreenState extends State<OnBoardingV4Screen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Brand Colors
  final Color primaryColor =
      const Color.fromARGB(255, 81, 13, 93); // Deep Purple
  final Color accentColor = const Color(0xFFF5F5FA);

  final List<Map<String, String>> onboardingData = [
    {
      "image":
          "https://img.freepik.com/free-vector/digital-currency-concept-illustration_53876-114407.jpg",
      "title": "Effortless Swaps",
      "subtitle":
          "A clean and simple way to get started. Customize this screen based on your app’s purpose.",
    },
    {
      "image":
          "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg",
      "title": "Secure Access",
      "subtitle":
          "Explain your app’s main feature here. Keep it short, attractive, and benefit-focused.",
    },
    {
      "image":
          "https://img.freepik.com/free-vector/revenue-graph-concept-illustration_114360-4299.jpg",
      "title": "Track Trends",
      "subtitle":
          "Describe another core feature. This should convince users why your app is worth using.",
    },
    {
      "image":
          "https://img.freepik.com/free-vector/investor-with-laptop-monitoring-growth-dividends-trader-sitting-stack-money-investing-fund-money-wealth-management-concept-vector-illustration_74855-13272.jpg",
      "title": "Grow Portfolio",
      "subtitle":
          "Wrap up with motivation. Tell users this app will make their life easier.",
    },
    {
      "image":
          "https://img.freepik.com/free-vector/rocket-concept-illustration_114360-1650.jpg",
      "title": "Start Journey",
      "subtitle":
          "You are all set! Join thousands of users who are already managing their workspace efficiently.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Decoration (Subtle Purple Blob)
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.05),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // =========================
                // 1️⃣ TOP BAR (Skip Button)
                // =========================
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_currentIndex != onboardingData.length - 1)
                        TextButton(
                          onPressed: () {
                            _pageController.animateToPage(
                              onboardingData.length - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Skip",
                            style: GoogleFonts.abel(
                              color: Colors.grey[500],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // =========================
                // 2️⃣ MAIN SLIDER
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image Container
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 320,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              // Soft neumorphic-style shadow
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.08),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                item['image']!,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor.withOpacity(0.5),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                      child: Icon(Icons.broken_image,
                                          size: 50, color: Colors.grey[300]));
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),

                          // Text Content
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              item['title']!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aboreto(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              item['subtitle']!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.abel(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // =========================
                // 3️⃣ BOTTOM CONTROLS
                // =========================
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Page Indicators
                      Row(
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 6),
                            width: _currentIndex == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? primaryColor
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),

                      // Dynamic Action Button (Arrow -> "Get Started")
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _currentIndex == onboardingData.length - 1
                            ? 160
                            : 60,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentIndex < onboardingData.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              // TODO: Navigate to Auth Screen
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                            shadowColor: primaryColor.withOpacity(0.4),
                            padding: EdgeInsets.zero,
                          ),
                          child: _currentIndex == onboardingData.length - 1
                              ? Text(
                                  "Get Started",
                                  style: GoogleFonts.abel(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 28,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
