import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

class FinanceDashboardScreen extends StatefulWidget {
  const FinanceDashboardScreen({super.key});

  @override
  State<FinanceDashboardScreen> createState() => _FinanceDashboardScreenState();
}

class _FinanceDashboardScreenState extends State<FinanceDashboardScreen> {
  // --- Design Constants ---
  final Color _backgroundColor = const Color(0xFFF0F5F2);
  final Color _primaryGreen = const Color(0xFFBFFF00);
  final Color _darkCardColor = const Color(0xFF1E1E1E);
  final Color _lightIconBg = const Color(0xFFE0E0E0);
  final Color _primaryTextColor = Colors.black;
  final Color _secondaryTextColor = Colors.black54;
  final double _cardBorderRadius = 25.0;
  final double _buttonBorderRadius = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
          backgroundColor: _backgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.wallet,
              color: _primaryTextColor,
              size: 50,
            ),
          )),
      // SafeArea ensures content doesn't overlap the status bar/notches
      body: SafeArea(
        child: Stack(
          children: [
            // Main Scrollable Content (No Slivers)
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Main Credit Card Widget ---
                    _buildCreditCard(),
                    const SizedBox(height: 30),

                    // --- Action Buttons (Send, Bill, Mobile, More) ---
                    _buildActionButtons(),
                    const SizedBox(height: 30),

                    // --- Quick Send Section ---
                    _buildQuickSend(),
                    const SizedBox(height: 30),

                    // --- Recent Activity Section ---
                    _buildRecentActivity(),
                    const SizedBox(height: 100), // Space for bottom nav bar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  // --- Custom Bottom Nav Bar (Activated) ---
  Widget _buildCustomBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 24),
      decoration: BoxDecoration(
        color: _darkCardColor, // Black background for the nav bar
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: _darkCardColor.withOpacity(0.4),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home_filled, "Home", true),
          _buildNavBarItem(Icons.credit_card_rounded, "Cards", false),
          _buildNavBarFab(), // The central FAB
          _buildNavBarItem(Icons.bar_chart_rounded, "Stats", false),
          _buildNavBarItem(Icons.person, "Profile", false),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? _primaryGreen : Colors.white60,
          size: 28,
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 4,
            width: 4,
            decoration: BoxDecoration(
              color: _primaryGreen,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  // --- REMAINDER OF WIDGETS (UNCHANGED) ---

  Widget _buildCreditCard() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: _darkCardColor,
        borderRadius: BorderRadius.circular(_cardBorderRadius),
        boxShadow: [
          BoxShadow(
            color: _primaryGreen.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(2, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "VISA",
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: _primaryGreen, size: 20),
              const SizedBox(width: 8),
              Text(
                "Balance",
                style: GoogleFonts.inter(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "\$ 25,453.00",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "•••• •••• •••• 7281",
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.wifi_rounded,
                  color: _primaryGreen, size: 24), // Wifi icon
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "William Current",
                style: GoogleFonts.inter(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
              Text(
                "Exp 07/26",
                style: GoogleFonts.inter(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.send_rounded, "Send"),
        _buildActionButton(Icons.receipt_long, "Bill"),
        _buildActionButton(Icons.phone_android, "Mobile"),
        _buildActionButton(Icons.more_horiz, "More"),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_buttonBorderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, color: _primaryTextColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: _primaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickSend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quick Send",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _primaryTextColor,
              ),
            ),
            Text(
              "See all >",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: _secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildQuickSendAvatar(
                  'Adie', 'https://randomuser.me/api/portraits/women/1.jpg'),
              _buildQuickSendAvatar(
                  'Choir', 'https://randomuser.me/api/portraits/men/2.jpg'),
              _buildQuickSendAvatar(
                  'Famdt', 'https://randomuser.me/api/portraits/men/3.jpg'),
              _buildQuickSendAvatar(
                  'Happy', 'https://randomuser.me/api/portraits/women/4.jpg'),
              _buildQuickSendAvatar(
                  'Naya', 'https://randomuser.me/api/portraits/women/5.jpg'),
              _buildQuickSendAvatar(
                  'John', 'https://randomuser.me/api/portraits/men/6.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickSendAvatar(String name, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: _primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Activity",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _primaryTextColor,
              ),
            ),
            Text(
              "See all >",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: _secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildActivityItem(
            Icons.store, "Food Store", "Monday, 25 January", "-\$15.00"),
        _buildActivityItem(
            Icons.home, "House Rent", "Monday, 25 January", "-\$290.00"),
        _buildActivityItem(
            Icons.payment, "Online Payment", "Monday, 25 January", "-\$27.00"),
        _buildActivityItem(Icons.restaurant, "Food Store", "Monday, 25 January",
            "-\$15.00"), // Added for scroll effect
      ],
    );
  }

  Widget _buildActivityItem(
      IconData icon, String title, String subtitle, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_buttonBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _lightIconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: _primaryTextColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _primaryTextColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: _secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarFab() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: _primaryGreen,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _primaryGreen.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(Icons.qr_code_scanner, color: _primaryTextColor, size: 32),
    );
  }
}
