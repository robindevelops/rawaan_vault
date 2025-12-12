import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v1 - Main Settings Screen
class SettingV1Screen extends StatefulWidget {
  const SettingV1Screen({super.key});

  @override
  State<SettingV1Screen> createState() => _SettingV1ScreenState();
}

class _SettingV1ScreenState extends State<SettingV1Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

  bool _notifications = true;
  bool _darkMode = true;
  bool _biometric = false;

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
                _profileCard(),
                const SizedBox(height: 28),
                _sectionTitle('Preferences'),
                const SizedBox(height: 16),
                _toggleItem('Notifications', Icons.notifications_none,
                    _notifications, (v) => setState(() => _notifications = v)),
                _toggleItem('Dark Mode', Icons.dark_mode_outlined, _darkMode,
                    (v) => setState(() => _darkMode = v)),
                _toggleItem('Biometric Login', Icons.fingerprint, _biometric,
                    (v) => setState(() => _biometric = v)),
                const SizedBox(height: 28),
                _sectionTitle('Account'),
                const SizedBox(height: 16),
                _menuItem('Personal Info', Icons.person_outline),
                _menuItem('Security', Icons.shield_outlined),
                _menuItem('Payment Methods', Icons.credit_card_outlined),
                _menuItem('Linked Accounts', Icons.link),
                const SizedBox(height: 28),
                _sectionTitle('Support'),
                const SizedBox(height: 16),
                _menuItem('Help Center', Icons.help_outline),
                _menuItem('Terms of Service', Icons.description_outlined),
                _menuItem('Privacy Policy', Icons.privacy_tip_outlined),
                const SizedBox(height: 28),
                _logoutBtn(),
                const SizedBox(height: 20),
                Center(
                    child: Text('Version 1.0.0',
                        style:
                            GoogleFonts.inter(color: _textSec, fontSize: 12))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        children: [
          Text('Settings',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 28, fontWeight: FontWeight.w700)),
        ],
      );

  Widget _profileCard() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _border)),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: _bg, borderRadius: BorderRadius.circular(14)),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _text,
                          fontSize: 24,
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
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text('rawaan@email.com',
                      style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _sectionTitle(String t) => Text(t,
      style: GoogleFonts.inter(
          color: _textSec,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 1));

  Widget _toggleItem(
          String title, IconData icon, bool value, Function(bool) onChanged) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _border)),
        child: Row(
          children: [
            Icon(icon, color: _text, size: 22),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: _text,
              activeTrackColor: _textSec,
              inactiveThumbColor: _textSec,
              inactiveTrackColor: _border,
            ),
          ],
        ),
      );

  Widget _menuItem(String title, IconData icon) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _border)),
        child: Row(
          children: [
            Icon(icon, color: _text, size: 22),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Icon(Icons.chevron_right, color: _textSec, size: 22),
          ],
        ),
      );

  Widget _logoutBtn() => Container(
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
