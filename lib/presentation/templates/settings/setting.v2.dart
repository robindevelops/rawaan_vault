import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v3 - Light Blue Accent Theme
class SettingV2Screen extends StatefulWidget {
  const SettingV2Screen({super.key});

  @override
  State<SettingV2Screen> createState() => _SettingV2ScreenState();
}

class _SettingV2ScreenState extends State<SettingV2Screen> {
  static const Color _bg = Color(0xFFF5F7FA);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _accent = Color(0xFF2563EB);
  static const Color _text = Color(0xFF1F2937);
  static const Color _textSec = Color(0xFF6B7280);

  bool _notifications = true;
  bool _darkMode = false;

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
                Text('Settings',
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 28,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 28),
                _profileSection(),
                const SizedBox(height: 24),
                _settingsGroup('General', [
                  _toggleTile(
                      'Push Notifications',
                      Icons.notifications_outlined,
                      _notifications,
                      (v) => setState(() => _notifications = v)),
                  _toggleTile('Dark Mode', Icons.dark_mode_outlined, _darkMode,
                      (v) => setState(() => _darkMode = v)),
                ]),
                const SizedBox(height: 20),
                _settingsGroup('Account', [
                  _navTile('Personal Information', Icons.person_outline),
                  _navTile('Security', Icons.lock_outline),
                  _navTile('Privacy', Icons.shield_outlined),
                ]),
                const SizedBox(height: 20),
                _settingsGroup('About', [
                  _navTile('Help & Support', Icons.help_outline),
                  _navTile('Terms of Service', Icons.article_outlined),
                ]),
                const SizedBox(height: 28),
                _logoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileSection() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _accent, borderRadius: BorderRadius.circular(20)),
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
                  Text('rawaan@email.com',
                      style: GoogleFonts.inter(
                          color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.edit, color: Colors.white, size: 20),
            ),
          ],
        ),
      );

  Widget _settingsGroup(String title, List<Widget> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 12),
            child: Text(title,
                style: GoogleFonts.inter(
                    color: _textSec,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
            decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4))
                ]),
            child: Column(children: items),
          ),
        ],
      );

  Widget _toggleTile(
          String title, IconData icon, bool value, Function(bool) onChanged) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: _accent, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Switch(value: value, onChanged: onChanged, activeColor: _accent),
          ],
        ),
      );

  Widget _navTile(String title, IconData icon) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: _accent, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _logoutButton() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            'Log Out',
            style: GoogleFonts.inter(
                color: Colors.red, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      );
}
