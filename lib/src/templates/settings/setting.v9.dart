import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v12 - Indigo Theme
class SettingV9Screen extends StatefulWidget {
  const SettingV9Screen({super.key});

  @override
  State<SettingV9Screen> createState() => _SettingV9ScreenState();
}

class _SettingV9ScreenState extends State<SettingV9Screen> {
  static const Color _bg = Color(0xFFF0F4FF);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _accent = Color(0xFF4F46E5);
  static const Color _text = Color(0xFF1E1B4B);
  static const Color _textSec = Color(0xFF6366F1);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 24),
                _profileCard(),
                const SizedBox(height: 24),
                _planCard(),
                const SizedBox(height: 24),
                _settingsGrid(),
                const SizedBox(height: 24),
                _supportSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Settings',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 28, fontWeight: FontWeight.w700)),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05), blurRadius: 10)
                ]),
            child: Icon(Icons.search, color: _accent),
          ),
        ],
      );

  Widget _profileCard() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: _accent.withOpacity(0.1), blurRadius: 20)
            ]),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [_accent, const Color(0xFF818CF8)]),
                  borderRadius: BorderRadius.circular(16)),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: Colors.white,
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
                          color: _text,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Text('Edit Profile',
                      style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _planCard() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [_accent, const Color(0xFF7C3AED)]),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.diamond_outlined,
                  color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Upgrade to Pro',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Text('Unlock all features',
                      style: GoogleFonts.inter(
                          color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Text('Go Pro',
                  style: GoogleFonts.inter(
                      color: _accent,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );

  Widget _settingsGrid() => GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
        children: [
          _gridCard('Account', Icons.person_outline),
          _gridCard('Privacy', Icons.shield_outlined),
          _gridCard('Notifications', Icons.notifications_outlined),
          _gridCard('Appearance', Icons.palette_outlined),
        ],
      );

  Widget _gridCard(String label, IconData icon) => Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: _accent, size: 22),
            ),
            const Spacer(),
            Text(label,
                style: GoogleFonts.inter(
                    color: _text, fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      );

  Widget _supportSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SUPPORT',
              style: GoogleFonts.inter(
                  color: _textSec,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1)),
          const SizedBox(height: 12),
          _supportItem('Help Center', Icons.help_outline),
          _supportItem('About', Icons.info_outline),
          _supportItem('Log Out', Icons.logout, isLogout: true),
        ],
      );

  Widget _supportItem(String title, IconData icon, {bool isLogout = false}) =>
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)
            ]),
        child: Row(
          children: [
            Icon(icon, color: isLogout ? Colors.red : _accent, size: 22),
            const SizedBox(width: 14),
            Text(title,
                style: GoogleFonts.inter(
                    color: isLogout ? Colors.red : _text, fontSize: 15)),
            const Spacer(),
            if (!isLogout) Icon(Icons.chevron_right, color: _textSec, size: 20),
          ],
        ),
      );
}
