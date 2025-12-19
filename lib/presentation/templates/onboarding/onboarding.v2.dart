import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingV2Screen extends StatefulWidget {
  const OnBoardingV2Screen({super.key});

  @override
  State<OnBoardingV2Screen> createState() => _OnBoardingV2ScreenState();
}

class _OnBoardingV2ScreenState extends State<OnBoardingV2Screen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Premium Color Palette
  static const Color _primary = Color(0xFF6C63FF);
  static const Color _primaryLight = Color(0xFF8B85FF);
  static const Color _dark = Color(0xFF1A1A2E);
  static const Color _textDark = Color(0xFF2D2D3A);
  static const Color _textLight = Color(0xFF9E9EA7);
  static const Color _bg = Color(0xFFFFFFFF);

  final List<Map<String, dynamic>> _pages = [
    {
      'icon': Icons.rocket_launch_rounded,
      'title': 'Launch Your Ideas',
      'subtitle':
          'Transform your creative vision into reality with powerful tools designed for modern creators.',
      'color': Color(0xFF6C63FF),
    },
    {
      'icon': Icons.people_alt_rounded,
      'title': 'Collaborate Seamlessly',
      'subtitle':
          'Work together with your team in real-time. Share, edit, and create without boundaries.',
      'color': Color(0xFF00BFA6),
    },
    {
      'icon': Icons.trending_up_rounded,
      'title': 'Achieve Excellence',
      'subtitle':
          'Track your progress, hit milestones, and celebrate every success on your journey.',
      'color': Color(0xFFFF6B6B),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) => _buildPage(_pages[index]),
                ),
              ),
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [_primary, _primaryLight]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.auto_awesome,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                'Rawaan',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
            ],
          ),
          // Skip button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Text(
              'Skip',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> data) {
    final Color pageColor = data['color'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration container
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: pageColor.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer ring
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: pageColor.withOpacity(0.15), width: 2),
                  ),
                ),
                // Inner ring
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: pageColor.withOpacity(0.2), width: 2),
                  ),
                ),
                // Center icon container
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [pageColor, pageColor.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: pageColor.withOpacity(0.4),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Icon(data['icon'], color: Colors.white, size: 48),
                ),
                // Decorative dots
                Positioned(top: 40, right: 50, child: _dot(8, pageColor)),
                Positioned(bottom: 60, left: 40, child: _dot(12, pageColor)),
                Positioned(top: 80, left: 30, child: _dot(6, pageColor)),
              ],
            ),
          ),
          const SizedBox(height: 56),
          // Title
          Text(
            data['title'],
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: _textDark,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          // Subtitle
          Text(
            data['subtitle'],
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: _textLight,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBottomSection() {
    final Color currentColor = _pages[_currentPage]['color'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
      child: Column(
        children: [
          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 28 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? currentColor
                      : const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Action buttons
          Row(
            children: [
              // Back button (only show after first page)
              if (_currentPage > 0)
                Expanded(
                  child: Container(
                    height: 56,
                    margin: const EdgeInsets.only(right: 12),
                    child: OutlinedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        'Back',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                    ),
                  ),
                ),
              // Next/Get Started button
              Expanded(
                flex: _currentPage > 0 ? 1 : 1,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [currentColor, currentColor.withOpacity(0.85)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: currentColor.withOpacity(0.4),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Navigate to main screen
                        }
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage == _pages.length - 1
                                  ? 'Get Started'
                                  : 'Continue',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              _currentPage == _pages.length - 1
                                  ? Icons.arrow_forward
                                  : Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
