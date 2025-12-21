import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Subscription V2 - Spotify Style (Green accent, dark theme)
class SubscriptionV2Screen extends StatefulWidget {
  const SubscriptionV2Screen({super.key});

  @override
  State<SubscriptionV2Screen> createState() => _SubscriptionV2ScreenState();
}

class _SubscriptionV2ScreenState extends State<SubscriptionV2Screen> {
  int _selectedPlan = 0;

  static const Color _accent = Color(0xFF1DB954);
  static const Color _bg = Color(0xFF121212);

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
                "https://images.unsplash.com/photo-1614680376593-902f74cf0d41?w=800",
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
                        text: 'spotify ',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _accent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('premium',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Listen without limits\nAd-free music streaming',
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
                      _buildFeatureRow('Ad-free music listening'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Download to listen offline'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Play songs in any order'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('High quality audio'),
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
                          title: 'Monthly',
                          price: '\$10.99',
                          subtitle: 'Billed Monthly',
                          isSelected: _selectedPlan == 0,
                          onTap: () => setState(() => _selectedPlan = 0),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildPlanCard(
                          title: 'Yearly',
                          price: '\$99.99',
                          subtitle: '2 Months Free',
                          savings: 'Save \$32',
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
                            borderRadius: BorderRadius.circular(27)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Get Premium',
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 6),
                          const Icon(Icons.chevron_right,
                              color: Colors.black, size: 22),
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
                    'The subscription will automatically renew unless canceled at least 24 hours before the end of the current period.',
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
          borderRadius: BorderRadius.circular(12),
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
                      color: Colors.white54,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough)),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                if (subtitle.contains('Free'))
                  const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(Icons.card_giftcard,
                          color: Colors.white54, size: 14)),
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
