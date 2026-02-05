import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v6 - Navy Blue Theme
class SettingV4Screen extends StatefulWidget {
  const SettingV4Screen({super.key});

  @override
  State<SettingV4Screen> createState() => _SettingV4ScreenState();
}

class _SettingV4ScreenState extends State<SettingV4Screen> {
  static const Color _bg = Color(0xFF0F172A);
  static const Color _card = Color(0xFF1E293B);
  static const Color _accent = Color(0xFF60A5FA);
  static const Color _text = Color(0xFFF1F5F9);
  static const Color _textSec = Color(0xFF94A3B8);

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
                const SizedBox(height: 24),
                _statsRow(),
                const SizedBox(height: 28),
                Text('Settings',
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                _settingsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [_accent, const Color(0xFF818CF8)]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
                child: Text('R',
                    style: TextStyle(
                        color: Colors.white,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Icon(Icons.verified, color: _accent, size: 16),
                    const SizedBox(width: 4),
                    Text('Verified Account',
                        style: GoogleFonts.inter(color: _accent, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: _card, borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.qr_code, color: _text, size: 22),
          ),
        ],
      );

  Widget _statsRow() => Row(
        children: [
          _statCard('12', 'Projects'),
          const SizedBox(width: 12),
          _statCard('48', 'Tasks'),
          const SizedBox(width: 12),
          _statCard('156', 'Hours'),
        ],
      );

  Widget _statCard(String value, String label) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: _card, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Text(value,
                  style: GoogleFonts.inter(
                      color: _accent,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(label,
                  style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
            ],
          ),
        ),
      );

  Widget _settingsList() => Column(
        children: [
          _settingItem('Account', Icons.person_outline, 'Manage your account'),
          _settingItem(
              'Notifications', Icons.notifications_outlined, '3 new alerts'),
          _settingItem('Appearance', Icons.palette_outlined, 'Dark mode'),
          _settingItem('Security', Icons.shield_outlined, 'Two-factor enabled'),
          _settingItem('Storage', Icons.cloud_outlined, '65% used'),
          _settingItem('Help', Icons.help_outline, 'FAQs and support'),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                color: _accent, borderRadius: BorderRadius.circular(14)),
            child: Center(
                child: Text('Upgrade to Pro',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600))),
          ),
        ],
      );

  Widget _settingItem(String title, IconData icon, String subtitle) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
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
                      style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );
}
