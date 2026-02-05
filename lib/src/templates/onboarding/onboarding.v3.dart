import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 1. Model Class to hold page data
class OnboardingContent {
  final String title;
  final String subtitle;
  final String image;
  final String badge1;
  final String badge2;

  OnboardingContent({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.badge1,
    required this.badge2,
  });
}

class OnBoardingV3Screen extends StatefulWidget {
  const OnBoardingV3Screen({super.key});

  @override
  State<OnBoardingV3Screen> createState() => _OnBoardingV3ScreenState();
}

class _OnBoardingV3ScreenState extends State<OnBoardingV3Screen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  // 2. Data for the pages
  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: 'Utilize new\nopportunities',
      subtitle:
          'Add animated 3D objects, filters, and special effects to your photos and videos',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGgArqpf0zZVgsV7rCdJD6XVPzPjav1MU1w&s',
      badge1: "VR parties",
      badge2: "Closer than ever",
    ),
    OnboardingContent(
      title: 'Connect with\nFriends',
      subtitle:
          'Experience real-time interaction with spatial audio and immersive environments.',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB9sIu2iBHNvNRccAeDtOZ9b5QswR2DdnWpo4k3J752sOw0U1Cj_MvELQWOB3xNnYRPwQ&usqp=CAU',
      badge1: "Live Chat",
      badge2: "Immersive",
    ),
    OnboardingContent(
      title: 'Create your\nAvatar',
      subtitle:
          'Customize your digital persona with thousands of unique accessories and styles.',
      image:
          'https://www.shutterstock.com/image-photo/taking-break-comics-styled-yellow-600nw-1932401165.jpg',
      badge1: "Unique Style",
      badge2: "3D Assets",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Colors
    final Color darkNavy = const Color.fromARGB(255, 46, 46, 129);
    final Color lightPurpleBg = const Color.fromARGB(255, 239, 239, 253);
    final Color cardBg = const Color(0xFFBFAEFF);

    return Scaffold(
      backgroundColor: lightPurpleBg,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header (Static)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Rawaan',
                style: GoogleFonts.abrilFatface(
                  fontSize: 30,
                  height: 1.1,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                  color: darkNavy,
                ),
              ),
            ),

            // 2. Swipable Content Area
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: _contents.length,
                itemBuilder: (context, index) {
                  final content = _contents[index];
                  return SingleChildScrollView(
                    // Prevents overflow on smaller screens
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image Stack
                          SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: cardBg,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.purple.withOpacity(0.1),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(content.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Floating Badge: Right
                                Positioned(
                                  right: 10,
                                  top: 80,
                                  child: _buildFloatingBadge(
                                    text: content.badge1,
                                    rotate: 0.05,
                                  ),
                                ),

                                // Floating Badge: Left
                                Positioned(
                                  left: 0,
                                  bottom: 100,
                                  child: _buildFloatingBadge(
                                    text: content.badge2,
                                    rotate: -0.05,
                                  ),
                                ),

                                // Floating Icon (Static or Dynamic)
                                Positioned(
                                  left: 20,
                                  top: 60,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: const Text(
                                      "🎉",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Headline
                          Text(
                            content.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.abrilFatface(
                              fontSize: 38,
                              height: 1.1,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: darkNavy,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Subtitle
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              content.subtitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(
                                fontSize: 13,
                                height: 1.4,
                                color: darkNavy.withOpacity(0.7),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 3. Dots Indicator (Dynamic)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _contents.length,
                (index) => _buildDot(
                  isActive: index == _currentPage,
                  isLong: index == _currentPage,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 4. Bottom Buttons (Static)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _contents.length - 1) {
                          // Go to next page
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          // Handle Sign Up
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkNavy,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Text(
                        _currentPage == _contents.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: darkNavy,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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

  Widget _buildFloatingBadge({required String text, double rotate = 0.0}) {
    return Transform.rotate(
      angle: rotate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF0A0A35),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildDot({bool isActive = false, bool isLong = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isLong ? 24 : 6,
      height: 6,
      decoration: BoxDecoration(
        color:
            isActive ? const Color(0xFF0A0A35) : Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
