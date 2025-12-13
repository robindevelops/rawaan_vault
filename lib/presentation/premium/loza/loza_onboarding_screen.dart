import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_welcome_screen.dart';

/// LOZA Onboarding Screen - Minimal Design
/// Features: Clean PageView with 3 slides showcasing furniture products
class LozoOnboardingScreen extends StatefulWidget {
  const LozoOnboardingScreen({super.key});

  @override
  State<LozoOnboardingScreen> createState() => _LozoOnboardingScreenState();
}

class _LozoOnboardingScreenState extends State<LozoOnboardingScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _indicatorGrey = Color(0xFFE5E5E5);

  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Discover',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl:
          'https://images.unsplash.com/photo-1563861826100-9cb868fdbe1c?w=800',
      buttonText: 'Start shopping',
    ),
    OnboardingItem(
      title: 'New Arrivals',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl:
          'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?w=800',
      buttonText: 'GET STARTED!',
    ),
    OnboardingItem(
      title: 'Our favourite\nlooks for you style',
      description:
          'Many desktop publishing packages and web page editors now use.',
      imageUrl:
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800',
      buttonText: 'Get Started',
      isFullImage: true,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    } else {
      // Navigate to Welcome screen after onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LozoWelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _items.length,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          final item = _items[index];
          if (item.isFullImage) {
            return _buildFullImageSlide(item);
          }
          return _buildMinimalSlide(item);
        },
      ),
    );
  }

  Widget _buildMinimalSlide(OnboardingItem item) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 60),
          // Title
          Text(
            item.title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              item.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: _textGrey,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          // Product Image
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[100],
                child: Icon(Icons.image_outlined,
                    size: 60, color: Colors.grey[400]),
              ),
            ),
          ),
          const Spacer(),
          // Page Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _items.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: index == _currentPage ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentPage ? _primaryBlack : _indicatorGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryBlack,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  item.buttonText,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildFullImageSlide(OnboardingItem item) {
    return Stack(
      children: [
        // Background Image - Right Side
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[200],
            ),
          ),
        ),
        // Left Content Area
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    // Page Indicators
                    Row(
                      children: List.generate(
                        _items.length,
                        (index) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentPage
                                ? _primaryBlack
                                : _indicatorGrey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Title
                    Text(
                      item.title,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: _primaryBlack,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Description
                    Text(
                      item.description,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: _textGrey,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryBlack,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          item.buttonText,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;
  final String buttonText;
  final bool isFullImage;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.buttonText,
    this.isFullImage = false,
  });
}
