import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/maniro/maniro_auth_screen.dart';

/// Maniro Onboarding Screen
/// Features: 3 onboarding pages with fashion images, smooth page transitions
class ManiroOnboardingScreen extends StatefulWidget {
  const ManiroOnboardingScreen({super.key});

  @override
  State<ManiroOnboardingScreen> createState() => _ManiroOnboardingScreenState();
}

class _ManiroOnboardingScreenState extends State<ManiroOnboardingScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);

  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Discover Latest Trends',
      description:
          'Stay ahead of fashion with our curated collection of the hottest styles and must-have pieces',
      imageUrl:
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=800',
    ),
    OnboardingItem(
      title: 'Shop With Confidence',
      description:
          'Enjoy secure payments, easy returns, and 24/7 customer support for a seamless experience',
      imageUrl:
          'https://images.unsplash.com/photo-1445205170230-053b83016050?w=800',
    ),
    OnboardingItem(
      title: 'Express Your Style',
      description:
          'Find pieces that reflect your personality and make every day a fashion statement',
      imageUrl:
          'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToAuth();
    }
  }

  void _navigateToAuth() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ManiroAuthScreen(isLogin: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Page View
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: _onboardingItems.length,
              itemBuilder: (context, index) {
                return _buildPage(_onboardingItems[index]);
              },
            ),
          ),
          // Bottom Section
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingItem item) {
    return Column(
      children: [
        // Image Section
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFF8F9FA),
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Content Section
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: _primaryBlack,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: _textGrey,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingItems.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 32 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? _primaryBlack
                        : const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Buttons Row
            Row(
              children: [
                // Skip Button
                if (_currentPage < _onboardingItems.length - 1)
                  Expanded(
                    child: TextButton(
                      onPressed: _navigateToAuth,
                      child: Text(
                        'Skip',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: _textGrey,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 16),
                // Next/Get Started Button
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryBlack,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == _onboardingItems.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
