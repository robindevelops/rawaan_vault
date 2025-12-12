import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v5 - Cream/Warm Theme
class SettingV5Screen extends StatefulWidget {
  const SettingV5Screen({super.key});

  @override
  State<SettingV5Screen> createState() => _SettingV5ScreenState();
}

class _SettingV5ScreenState extends State<SettingV5Screen> {
  static const Color _bg = Color(0xFFFAF7F2);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _accent = Color(0xFFD97706);
  static const Color _text = Color(0xFF44403C);
  static const Color _textSec = Color(0xFF78716C);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _header(),
                // _profileCard(),
                const SizedBox(height: 20),
                _quickActions(),
                const SizedBox(height: 24),
                _menuList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text('Profile',
                style: GoogleFonts.playfairDisplay(
                    color: _text, fontSize: 28, fontWeight: FontWeight.w700)),
            const Spacer(),
            Icon(Icons.settings_outlined, color: _text),
          ],
        ),
      );

  Widget _profileCard() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: _accent.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8))
            ]),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.15), shape: BoxShape.circle),
              child: Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _accent,
                          fontSize: 32,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 16),
            Text('Rawaan User',
                style: GoogleFonts.playfairDisplay(
                    color: _text, fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text('rawaan@email.com',
                style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: _accent, borderRadius: BorderRadius.circular(20)),
              child: Text('Edit Profile',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );

  Widget _quickActions() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _actionBtn('Wallet', Icons.account_balance_wallet_outlined),
            const SizedBox(width: 12),
            _actionBtn('Orders', Icons.receipt_long_outlined),
            const SizedBox(width: 12),
            _actionBtn('Favorites', Icons.favorite_outline),
          ],
        ),
      );

  Widget _actionBtn(String label, IconData icon) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
              color: _card, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Icon(icon, color: _accent, size: 26),
              const SizedBox(height: 8),
              Text(label, style: GoogleFonts.inter(color: _text, fontSize: 13)),
            ],
          ),
        ),
      );

  Widget _menuList() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _menuItem('Account Settings', Icons.person_outline),
            _menuItem('Notifications', Icons.notifications_outlined),
            _menuItem('Privacy', Icons.lock_outline),
            _menuItem('Help Center', Icons.help_outline),
            _menuItem('About', Icons.info_outline),
            const SizedBox(height: 16),
            _logoutBtn(),
          ],
        ),
      );

  Widget _menuItem(String title, IconData icon) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Icon(icon, color: _accent, size: 22),
            const SizedBox(width: 16),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Icon(Icons.chevron_right, color: _textSec, size: 22),
          ],
        ),
      );

  Widget _logoutBtn() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.red[400], size: 22),
            const SizedBox(width: 16),
            Text('Log Out',
                style: GoogleFonts.inter(
                    color: Colors.red[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );
}
