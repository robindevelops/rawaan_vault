import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Subscription V4 - Apple Style (Blue accent, minimal)
class SubscriptionV4Screen extends StatefulWidget {
  const SubscriptionV4Screen({super.key});

  @override
  State<SubscriptionV4Screen> createState() => _SubscriptionV4ScreenState();
}

class _SubscriptionV4ScreenState extends State<SubscriptionV4Screen> {
  int _selectedPlan = 0;

  static const Color _accent = Color(0xFF0071E3);
  static const Color _bg = Color(0xFF000000);

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
                "https://images.unsplash.com/photo-1478737270239-2f02b77fc618?w=800",
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
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.apple, color: Colors.white, size: 32),
                      ),
                      TextSpan(
                        text: ' Music',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Over 100 million songs.\nAd-free. Download & listen.',
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
                      _buildFeatureRow('Lossless Audio quality'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Spatial Audio with Dolby Atmos'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Sync across all devices'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Personalized recommendations'),
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
                          title: 'Individual',
                          price: '\$10.99',
                          subtitle: 'Billed Monthly',
                          isSelected: _selectedPlan == 0,
                          onTap: () => setState(() => _selectedPlan = 0),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildPlanCard(
                          title: 'Family',
                          price: '\$16.99',
                          subtitle: 'Up to 6 people',
                          savings: 'Best Value',
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
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Try It Free',
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
                    '1 month free, then \$10.99/month. No commitment. Cancel anytime.',
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
          borderRadius: BorderRadius.circular(14),
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
              Text(savings,
                  style: GoogleFonts.inter(
                      color: _accent,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                if (subtitle.contains('people'))
                  const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child:
                          Icon(Icons.people, color: Colors.white54, size: 14)),
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
