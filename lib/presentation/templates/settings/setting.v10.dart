import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v10 - Slate/Charcoal Theme
class SettingV10Screen extends StatefulWidget {
  const SettingV10Screen({super.key});

  @override
  State<SettingV10Screen> createState() => _SettingV10ScreenState();
}

class _SettingV10ScreenState extends State<SettingV10Screen> {
  static const Color _bg = Color(0xFF1E1E24);
  static const Color _card = Color(0xFF2A2A32);
  static const Color _accent = Color(0xFFE879F9);
  static const Color _text = Color(0xFFF4F4F5);
  static const Color _textSec = Color(0xFFA1A1AA);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 28),
                _profileBanner(),
                const SizedBox(height: 28),
                _gridMenu(),
                const SizedBox(height: 28),
                _otherSettings(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Text('Settings',
      style: GoogleFonts.inter(
          color: _text, fontSize: 28, fontWeight: FontWeight.w700));

  Widget _profileBanner() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [_accent.withOpacity(0.8), const Color(0xFF8B5CF6)]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _accent,
                          fontSize: 26,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rawaan User',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Text('View Profile',
                      style: GoogleFonts.inter(
                          color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16),
            ),
          ],
        ),
      );

  Widget _gridMenu() => GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          _gridItem('Account', Icons.person_outline),
          _gridItem('Security', Icons.shield_outlined),
          _gridItem('Privacy', Icons.lock_outline),
          _gridItem('Notifications', Icons.notifications_outlined),
          _gridItem('Display', Icons.palette_outlined),
          _gridItem('Language', Icons.translate),
        ],
      );

  Widget _gridItem(String label, IconData icon) => Container(
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: _accent, size: 24),
            ),
            const SizedBox(height: 10),
            Text(label, style: GoogleFonts.inter(color: _text, fontSize: 12)),
          ],
        ),
      );

  Widget _otherSettings() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MORE',
              style: GoogleFonts.inter(
                  color: _textSec,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1)),
          const SizedBox(height: 14),
          _listItem('Help & Support', Icons.help_outline),
          _listItem('About', Icons.info_outline),
          _listItem('Rate App', Icons.star_outline),
          const SizedBox(height: 14),
          _logoutItem(),
        ],
      );

  Widget _listItem(String title, IconData icon) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Icon(icon, color: _accent, size: 22),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _logoutItem() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red[400]!),
            borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: Text('Log Out',
                style: GoogleFonts.inter(
                    color: Colors.red[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w600))),
      );
}
