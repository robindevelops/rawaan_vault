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

  // =========================
  // 1️⃣ ONBOARDING DATA
  // =========================
  // Users can add their own images, titles, and subtitles here.
  // - 'image': Add your asset path (e.g., "assets/images/welcome.png")
  // - 'title': The main heading for each screen
  // - 'subtitle': The smaller descriptive text
  // You can add/remove screens as needed

  final List<Map<String, String>> onboardingData = [
    {
      "image": "your_image_path_here", // <-- Replace with your own image
      "title":
          "[App Name] – Your Modern Solution", // <-- Replace with your app name
      "subtitle":
          "A clean and simple way to get started. Customize this screen based on your app’s purpose.",
    },
    {
      "image": "your_image_path_here",
      "title": "Feature Highlight #1",
      "subtitle":
          "Explain your app’s main feature here. Keep it short, attractive, and benefit-focused.",
    },
    {
      "image": "your_image_path_here",
      "title": "Feature Highlight #2",
      "subtitle":
          "Describe another core feature. This should convince users why your app is worth using.",
    },
    {
      "image": "your_image_path_here",
      "title": "Get Started Effortlessly",
      "subtitle":
          "Wrap up with motivation. Tell users this app will make their life easier.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // =========================
            // 2️⃣ PAGE VIEW
            // =========================
            // This is the main onboarding carousel.
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
                      // Image
                      // Replace "your_image_path_here" in onboardingData with your own asset
                      Image.asset(
                        item['image']!,
                        width: 250,
                      ),
                      const SizedBox(height: 20),

                      // Title with a highlighted background
                      Transform.rotate(
                        angle: -0.05,
                        child: Container(
                          color: const Color(0xFFCFFF00),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            item['title']!,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          item['subtitle']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // =========================
            // 3️⃣ PAGE INDICATOR DOTS
            // =========================
            // Automatically updates as the user swipes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Colors.black
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // 4️⃣ GET STARTED BUTTON
            // =========================
            // Users can change the action inside onTap to navigate to login/signup screen
            GestureDetector(
              onTap: () {
                // TODO: Navigate to your app's main/home screen
              },
              child: Container(
                width: 280,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  "Get started!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // =========================
            // 5️⃣ ALREADY HAVE AN ACCOUNT BUTTON
            // =========================
            // Users can change the action inside onTap to navigate to login screen
            GestureDetector(
              onTap: () {
                // TODO: Navigate to your app's login screen
              },
              child: Container(
                width: 280,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFBFFF60),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  "I already have an account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
