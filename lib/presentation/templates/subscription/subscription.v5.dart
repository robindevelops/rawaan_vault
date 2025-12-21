import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Subscription V5 - Discord Style (Purple/Blurple accent)
class SubscriptionV5Screen extends StatefulWidget {
  const SubscriptionV5Screen({super.key});

  @override
  State<SubscriptionV5Screen> createState() => _SubscriptionV5ScreenState();
}

class _SubscriptionV5ScreenState extends State<SubscriptionV5Screen> {
  int _selectedPlan = 0;

  static const Color _accent = Color(0xFF5865F2);
  static const Color _nitro = Color(0xFFFF73FA);
  static const Color _bg = Color(0xFF1E1F22);

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
                "https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?w=800",
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
                        text: 'discord ',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [_accent, _nitro]),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('nitro',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Level up your Discord\nexperience',
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
                      _buildFeatureRow('Custom emoji anywhere'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('HD video & screen share'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('2 Server Boosts included'),
                      const SizedBox(height: 12),
                      _buildFeatureRow('Bigger file uploads (500MB)'),
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
                          price: '\$9.99',
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
                          subtitle: 'Save 16%',
                          savings: '2 Months Free',
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
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [_accent, _nitro]),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Get Nitro',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(width: 6),
                            const Icon(Icons.rocket_launch,
                                color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Disclaimer
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Subscription automatically renews unless canceled. Manage your subscription in Settings.',
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
        ShaderMask(
          shaderCallback: (bounds) =>
              LinearGradient(colors: [_accent, _nitro]).createShader(bounds),
          child: const Icon(Icons.check, color: Colors.white, size: 20),
        ),
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
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(colors: [_accent, _nitro])
                            .createShader(bounds),
                    child: const Icon(Icons.check_circle,
                        color: Colors.white, size: 20),
                  ),
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
                  gradient: LinearGradient(colors: [
                    _accent.withOpacity(0.3),
                    _nitro.withOpacity(0.3)
                  ]),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(savings,
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                if (subtitle.contains('Save'))
                  const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child:
                          Icon(Icons.savings, color: Colors.white54, size: 14)),
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
