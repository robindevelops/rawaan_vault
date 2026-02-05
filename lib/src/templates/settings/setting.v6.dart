import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v8 - Light Gray Minimal Theme
class SettingV6Screen extends StatefulWidget {
  const SettingV6Screen({super.key});

  @override
  State<SettingV6Screen> createState() => _SettingV6ScreenState();
}

class _SettingV6ScreenState extends State<SettingV6Screen> {
  static const Color _bg = Color(0xFFFFFFFF);
  static const Color _surface = Color(0xFFF4F4F5);
  static const Color _text = Color(0xFF18181B);
  static const Color _textSec = Color(0xFF71717A);
  static const Color _border = Color(0xFFE4E4E7);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Settings',
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 32),
                _userTile(),
                const SizedBox(height: 32),
                _section('ACCOUNT', [
                  _listItem('Personal Information', Icons.person_outline),
                  _listItem('Password & Security', Icons.lock_outline),
                  _listItem('Privacy Settings', Icons.visibility_outlined),
                ]),
                _section('PREFERENCES', [
                  _listItem('Notifications', Icons.notifications_outlined),
                  _listItem('Appearance', Icons.contrast),
                  _listItem('Language', Icons.translate),
                ]),
                _section('SUPPORT', [
                  _listItem('Help Center', Icons.help_outline),
                  _listItem('Report a Problem', Icons.flag_outlined),
                  _listItem('Rate Us', Icons.star_outline),
                ]),
                const SizedBox(height: 24),
                _logoutBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userTile() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _surface, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: _text, borderRadius: BorderRadius.circular(14)),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
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
                  Text('rawaan@email.com',
                      style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _section(String title, List<Widget> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(title,
                style: GoogleFonts.inter(
                    color: _textSec,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1)),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: _border),
                borderRadius: BorderRadius.circular(16)),
            child: Column(children: items),
          ),
          const SizedBox(height: 24),
        ],
      );

  Widget _listItem(String title, IconData icon) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: _border.withOpacity(0.5)))),
        child: Row(
          children: [
            Icon(icon, color: _text, size: 22),
            const SizedBox(width: 16),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Icon(Icons.chevron_right, color: _textSec, size: 20),
          ],
        ),
      );

  Widget _logoutBtn() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: Text('Sign Out',
                style: GoogleFonts.inter(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600))),
      );
}
