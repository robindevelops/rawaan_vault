import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionV1Screen extends StatefulWidget {
  const SubscriptionV1Screen({super.key});

  @override
  State<SubscriptionV1Screen> createState() => _SubscriptionV1ScreenState();
}

class _SubscriptionV1ScreenState extends State<SubscriptionV1Screen> {
  int _selectedPlan = 0; // 0 = Monthly, 1 = Yearly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
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
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: Image.network(
                "https://framerusercontent.com/images/aqxQ9SVEQRfQqhY36ZcaBq9hY.jpeg?scale-down-to=2048",
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
                      Text(
                        'Restore',
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Title
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'perplexity ',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
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
                          child: Text(
                            'pro',
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Unlock the most powerful AI\nresearch assistant',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),

                const Spacer(),

                // Features list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildFeatureRow('Over 300 Copilot uses per day'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Unlock GPT-4 & Claude 2'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Pro support from our team'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Early access to new features'),
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
                          price: '\$20.00',
                          subtitle: 'Billed Monthly',
                          isSelected: _selectedPlan == 0,
                          onTap: () => setState(() => _selectedPlan = 0),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildPlanCard(
                          title: 'Yearly',
                          price: '\$200.00',
                          subtitle: 'Free 1 Week Trial',
                          savings: 'Save \$40.00',
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
                        backgroundColor: const Color(0xFF20D5D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Subscribe',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
                    'The subscription will automatically renew unless it is canceled at least 24 hours before the end of the current period.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white38,
                      fontSize: 12,
                      height: 1.4,
                    ),
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
        const Icon(Icons.check, color: Color(0xFF20D5D2), size: 20),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
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
            color: isSelected ? const Color(0xFF20D5D2) : Colors.white24,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: isSelected ? const Color(0xFF20D5D2) : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle,
                      color: Color(0xFF20D5D2), size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: GoogleFonts.inter(
                color: isSelected ? const Color(0xFF20D5D2) : Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (savings != null) ...[
              const SizedBox(height: 4),
              Text(
                savings,
                style: GoogleFonts.inter(
                  color: Colors.white54,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                if (subtitle.contains('Trial'))
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(Icons.calendar_today,
                        color: Colors.white54, size: 14),
                  ),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color:
                        isSelected ? const Color(0xFF20D5D2) : Colors.white54,
                    fontSize: 13,
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
