import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class UberV1Screen extends StatelessWidget {
  const UberV1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // Custom AppBar
        appBar: AppBar(
          toolbarHeight: 60,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RAWAAN",
                  style: GoogleFonts.fjallaOne(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Hostel >",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchAndShortcuts(),
                // 2. SERVICES GRID (Refactored)
                const SizedBox(height: 30),

                const ModernServicesGrid(),

                const SizedBox(height: 30),

                // 3. PROMO BANNER
                TextField(
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    hintText: "Where to?",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black87,
                      size: 28,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey[200]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey[200]!,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                const ModernPromoBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchAndShortcuts extends StatelessWidget {
  const SearchAndShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The Search Bar
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6), // Slightly darker than white
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                // Navigate to search screen
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 28, color: Colors.black87),
                    const SizedBox(width: 15),
                    Text(
                      "Where to?",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time_filled,
                              size: 14, color: Colors.black54),
                          const SizedBox(width: 5),
                          Text(
                            "Now",
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const Icon(Icons.keyboard_arrow_down, size: 14),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        // Saved Places Row
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildShortcutPill(Icons.home_rounded, "Home"),
              const SizedBox(width: 10),
              _buildShortcutPill(Icons.work_rounded, "Office"),
              const SizedBox(width: 10),
              _buildShortcutPill(Icons.star_rounded, "Gym"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildShortcutPill(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// MODERN SERVICES GRID
// ---------------------------------------------------------------------------
class ModernServicesGrid extends StatelessWidget {
  const ModernServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Row: City to City (Wide Card)
        _buildServiceCard(
          title: "City to City",
          subtitle: "Long distance rides",
          icon: "https://cdn-icons-png.flaticon.com/128/12723/12723024.png",
          color: const Color(0xFFF5F5F5), // Light Grey
          iconColor: const Color(0xFFEF5350),
          height: 110,
          isWide: true,
        ),
        const SizedBox(height: 16),

        // Bottom Row: Delivery & Rides (Split)
        Row(
          children: [
            Expanded(
              child: _buildServiceCard(
                title: "Bike",
                subtitle: "Cheaper",
                icon: "https://cdn-icons-png.flaticon.com/128/618/618987.png",
                color: const Color(0xFFF5F5F5), // Light Grey
                iconColor: Colors.black87,
                height: 160,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildServiceCard(
                title: "Delivery",
                subtitle: "Send items",
                icon: "https://cdn-icons-png.flaticon.com/128/4280/4280243.png",
                color: const Color(0xFFF5F5F5),
                iconColor: Colors.black87,
                height: 160,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceCard({
    required String title,
    String? subtitle,
    required String icon,
    required Color color,
    required Color iconColor,
    required double height,
    bool isWide = false,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        // Subtle interaction shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: isWide ? Clip.none : Clip.antiAliasWithSaveLayer,
        children: [
          // Text Content (Top Left)
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ]
              ],
            ),
          ),

          // Decorative Icon (Bottom Right / Dynamic Placement)
          Positioned(
            right: isWide ? 25 : -35, // Stick out slightly if square
            bottom: isWide ? -5 : -20,
            child: Transform.rotate(
              angle: -math.pi / 12, // Slight tilt for dynamic look
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  icon,
                  // height: 00,
                  // color: iconColor,
                ),
              ),
            ),
          ),

          // Tap Ripple Effect
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// MODERN PROMO BANNER
// ---------------------------------------------------------------------------
class ModernPromoBanner extends StatelessWidget {
  const ModernPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24), // Tighter radius
        color: Colors.black, // Fallback
        image: const DecorationImage(
          // A more abstract/urban image usually fits better
          image: NetworkImage(
              'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient Overlay for text readability
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          // Banner Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "PROMO",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Get 20% off your\nfirst intercity ride.",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
