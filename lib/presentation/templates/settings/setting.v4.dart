import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v4 - Dark Teal Accent Theme
class SettingV4Screen extends StatefulWidget {
  const SettingV4Screen({super.key});

  @override
  State<SettingV4Screen> createState() => _SettingV4ScreenState();
}

class _SettingV4ScreenState extends State<SettingV4Screen> {
  static const Color _bg = Color(0xFF0F1419);
  static const Color _card = Color(0xFF1C2938);
  static const Color _accent = Color(0xFF14B8A6);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF8899A6);

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              _header(),
              _tabBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: _selectedTab == 0 ? _accountTab() : _preferencesTab(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [_accent, _accent.withOpacity(0.6)]),
                  borderRadius: BorderRadius.circular(14)),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rawaan',
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                Text('Premium Member',
                    style: GoogleFonts.inter(color: _accent, fontSize: 13)),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child:
                  const Icon(Icons.notifications_none, color: _text, size: 22),
            ),
          ],
        ),
      );

  Widget _tabBar() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            _tabItem('Account', 0),
            _tabItem('Preferences', 1),
          ],
        ),
      );

  Widget _tabItem(String title, int index) => Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _selectedTab = index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: _selectedTab == index ? _accent : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text(title,
                    style: GoogleFonts.inter(
                        color: _selectedTab == index ? Colors.white : _textSec,
                        fontSize: 14,
                        fontWeight: FontWeight.w600))),
          ),
        ),
      );

  Widget _accountTab() => Column(
        children: [
          _menuItem('Personal Info', Icons.person_outline, 'Manage your data'),
          _menuItem('Security', Icons.shield_outlined, 'Password & 2FA'),
          _menuItem('Payment', Icons.credit_card_outlined, '2 cards linked'),
          _menuItem('Subscription', Icons.star_outline, 'Premium active'),
          const SizedBox(height: 20),
          _dangerItem('Delete Account', Icons.delete_outline),
        ],
      );

  Widget _preferencesTab() => Column(
        children: [
          _menuItem('Language', Icons.language, 'English'),
          _menuItem('Notifications', Icons.notifications_outlined, 'Enabled'),
          _menuItem('Appearance', Icons.palette_outlined, 'Dark'),
          _menuItem('Privacy', Icons.lock_outline, 'Standard'),
        ],
      );

  Widget _menuItem(String title, IconData icon, String subtitle) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: _accent, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.inter(
                          color: _text,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  Text(subtitle,
                      style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _dangerItem(String title, IconData icon) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.red.withOpacity(0.3))),
        child: Row(
          children: [
            Icon(icon, color: Colors.red, size: 22),
            const SizedBox(width: 14),
            Text(title,
                style: GoogleFonts.inter(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );
}
