import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Subscription V3 - Netflix Style (Red accent, dark theme)
class SubscriptionV3Screen extends StatefulWidget {
  const SubscriptionV3Screen({super.key});

  @override
  State<SubscriptionV3Screen> createState() => _SubscriptionV3ScreenState();
}

class _SubscriptionV3ScreenState extends State<SubscriptionV3Screen> {
  int _selectedPlan = 0;

  static const Color _accent = Color(0xFFE50914);
  static const Color _bg = Color(0xFF141414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          // Hero image with fade
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white, Colors.transparent],
                stops: [0.0, 0.5, 1.0],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: Image.network(
                "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=800",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close,
                            color: Colors.white, size: 28),
                      ),
                      Text('Restore',
                          style: GoogleFonts.inter(
                              color: Colors.white70, fontSize: 16)),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Title
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'NETFLIX ',
                        style: GoogleFonts.bebasNeue(
                            color: _accent,
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('premium',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Unlimited movies, TV shows,\nand more',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Colors.white70, fontSize: 16, height: 1.4),
                ),

                const Spacer(),

                // Features list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildFeatureRow('Watch on any device'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Unlimited HD streaming'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Download & watch offline'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('No ads, no interruptions'),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Pricing cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildPlanCard(
                          title: 'Standard',
                          price: '\$15.49',
                          subtitle: 'HD Quality',
                          isSelected: _selectedPlan == 0,
                          onTap: () => setState(() => _selectedPlan = 0),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildPlanCard(
                          title: 'Premium',
                          price: '\$22.99',
                          subtitle: '4K + HDR',
                          savings: 'Best Quality',
                          isSelected: _selectedPlan == 1,
                          onTap: () => setState(() => _selectedPlan = 1),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Subscribe button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _accent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Start Membership',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 6),
                          const Icon(Icons.chevron_right,
                              color: Colors.white, size: 22),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Disclaimer
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Cancel anytime. No commitments. Your membership will auto-renew monthly.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: Colors.white38, fontSize: 12, height: 1.4),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Row(
      children: [
        const Icon(Icons.check, color: _accent, size: 20),
        const SizedBox(width: 12),
        Text(text, style: GoogleFonts.inter(color: Colors.white, fontSize: 15)),
      ],
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String subtitle,
    String? savings,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected ? _accent : Colors.white24,
              width: isSelected ? 2 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: GoogleFonts.inter(
                        color: isSelected ? _accent : Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                if (isSelected)
                  const Icon(Icons.check_circle, color: _accent, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Text(price,
                style: GoogleFonts.inter(
                    color: isSelected ? _accent : Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600)),
            if (savings != null) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                    color: _accent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(savings,
                    style: GoogleFonts.inter(
                        color: _accent,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(Icons.hd, color: Colors.white54, size: 14)),
                Text(subtitle,
                    style: GoogleFonts.inter(
                        color: isSelected ? _accent : Colors.white54,
                        fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
