import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingV2Screen extends StatefulWidget {
  const OnBoardingV2Screen({super.key});

  @override
  State<OnBoardingV2Screen> createState() => _OnBoardingV2ScreenState();
}

class _OnBoardingV2ScreenState extends State<OnBoardingV2Screen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Define Brand Colors
  final Color _limeGreen = const Color(0xFFBFFF60);
  final Color _forestGreen = Colors.green.shade900;

  // Dummy Data for the slider
  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Team Up For Success",
      "subtitle":
          "Great things in business are never done by one person. They're done by a team of people.",
      "image":
          "https://img.freepik.com/free-vector/flat-creativity-concept-illustration_52683-64279.jpg",
    },
    {
      "title": "Work Smarter",
      "subtitle":
          "Leverage tools that help you organize your workflow and boost productivity effortlessly.",
      "image":
          "https://img.freepik.com/free-vector/business-team-brainstorming-discussing-startup-project_74855-6909.jpg",
    },
    {
      "title": "Achieve Goals",
      "subtitle":
          "Set milestones, track progress, and celebrate victories with your entire organization.",
      "image":
          "https://img.freepik.com/free-vector/business-mission-concept-illustration_114360-7295.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Bar (Logo + Skip)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bolt_rounded, color: _forestGreen, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Rawwaan",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _forestGreen,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle Skip
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                    ),
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),

            // 2. Main Slider Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return _buildPageContent(
                    data: _onboardingData[index],
                  );
                },
              ),
            ),

            // 3. Bottom Section (Indicators + Button)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? _forestGreen
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Primary Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _onboardingData.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Navigate to Login
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _limeGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentPage == _onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _forestGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({required Map<String, String> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Container with subtle decoration
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5FA),
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                data["image"]!,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: _forestGreen,
                    ),
                  );
                },
                errorBuilder: (context, error, stack) => Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey.shade400,
                  size: 50,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Text Content
          Text(
            data["title"]!,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data["subtitle"]!,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
