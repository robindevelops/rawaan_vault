import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ------------------------------
/// Rawwaan Onboarding Template V4
/// ------------------------------
/// Description:
/// Modern and clean onboarding screen with:
/// - Swipeable pages with images
/// - Headline and subtitle per page
/// - Sleek animated page indicators
/// - Polished final "Get Started" button
/// Designed for easy reuse across Rawwaan apps.
/// ------------------------------

class OnBoardingV4Screen extends StatefulWidget {
  const OnBoardingV4Screen({super.key});

  @override
  State<OnBoardingV4Screen> createState() => _OnBoardingV4ScreenState();
}

class _OnBoardingV4ScreenState extends State<OnBoardingV4Screen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfveHqY7RTKdmMAGmOb-iWU-Ks0mzkjdH-nA&s",
      "title": "Effortless Crypto Swaps",
      "subtitle":
          "A clean and simple way to get started. Customize this screen based on your app’s purpose.",
    },
    {
      "image": "https://forkast.news/wp-content/uploads/2022/03/NFT-Avatar.png",
      "title": "Secure & Fast Transactions",
      "subtitle":
          "Explain your app’s main feature here. Keep it short, attractive, and benefit-focused.",
    },
    {
      "image": "https://www.tzapac.com/images/tezos-nfts.jpeg",
      "title": "Track Market Trends",
      "subtitle":
          "Describe another core feature. This should convince users why your app is worth using.",
    },
    {
      "image":
          "https://www.sciencefriday.com/wp-content/uploads/2021/05/Vakseen-The_Resilience_of_a_Rose_8x8__Acrylic_on_wood_2020.jpg",
      "title": "Grow Your Portfolio",
      "subtitle":
          "Wrap up with motivation. Tell users this app will make their life easier.",
    },
    {
      "image":
          "https://www.sciencefriday.com/wp-content/uploads/2021/05/Vakseen-The_Resilience_of_a_Rose_8x8__Acrylic_on_wood_2020.jpg",
      "title": "Start Your Crypto Journey",
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
            // 1️⃣ PAGE VIEW
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
                      // Polished Image with shadow & rounded corners
                      Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          item['title']!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: GoogleFonts.acme(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.black26.withOpacity(0.8),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          item['subtitle']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            height: 1.5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // 2️⃣ PAGE INDICATOR / BUTTON
            // =========================
            _currentIndex == onboardingData.length - 1
                ? GestureDetector(
                    onTap: () {
                      // TODO: Navigate to your app's main/home screen
                    },
                    child: Container(
                      width: 280,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Text(
                        "I am ready to start",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 3,
                        height: _currentIndex == index ? 18 : 13,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Colors.black
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
