import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_cart_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_welcome_screen.dart';

/// LOZA Profile Screen
/// Features: User info, menu options, settings, logout
class LozaProfileScreen extends StatelessWidget {
  const LozaProfileScreen({super.key});

  static const Color _primaryTeal = Color(0xFF2D4F4F);
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF5F5F5);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Header
              _buildProfileHeader(),
              const SizedBox(height: 30),
              // Stats Row
              _buildStatsRow(),
              const SizedBox(height: 30),
              // Menu Items
              _buildMenuSection(context),
              const SizedBox(height: 20),
              // Logout Button
              _buildLogoutButton(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        // Avatar
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _backgroundGrey,
            shape: BoxShape.circle,
            border: Border.all(color: _primaryTeal, width: 3),
          ),
          child: ClipOval(
            child: Image.network(
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.person,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Name
        Text(
          'John Doe',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: _primaryBlack,
          ),
        ),
        const SizedBox(height: 4),
        // Email
        Text(
          'john.doe@email.com',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _textGrey,
          ),
        ),
        const SizedBox(height: 12),
        // Edit Profile Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: _primaryTeal),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Edit Profile',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _primaryTeal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _buildStatItem('12', 'Orders'),
          _buildDivider(),
          _buildStatItem('4', 'Wishlist'),
          _buildDivider(),
          _buildStatItem('2', 'Reviews'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: _primaryTeal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: _textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: _borderGrey,
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            subtitle: 'Track your orders',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.favorite_outline,
            title: 'Wishlist',
            subtitle: 'Your favorite items',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Shipping Address',
            subtitle: 'Manage addresses',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.credit_card_outlined,
            title: 'Payment Methods',
            subtitle: 'Cards & accounts',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Manage alerts',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
            subtitle: 'Get assistance',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: _borderGrey)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _backgroundGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: _primaryTeal, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: _primaryBlack,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: _textGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: _textGrey),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton.icon(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LozoWelcomeScreen()),
              (route) => false,
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(Icons.logout, size: 20),
          label: Text(
            'Logout',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
