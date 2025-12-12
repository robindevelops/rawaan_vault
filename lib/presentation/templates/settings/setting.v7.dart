import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v7 - Dark Purple Accent Theme
class SettingV7Screen extends StatefulWidget {
  const SettingV7Screen({super.key});

  @override
  State<SettingV7Screen> createState() => _SettingV7ScreenState();
}

class _SettingV7ScreenState extends State<SettingV7Screen> {
  static const Color _bg = Color(0xFF13111C);
  static const Color _card = Color(0xFF1E1B2E);
  static const Color _accent = Color(0xFFA78BFA);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF9CA3AF);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _profileHeader(),
                const SizedBox(height: 8),
                _membershipCard(),
                const SizedBox(height: 24),
                _iconMenu(),
                const SizedBox(height: 24),
                _settingsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileHeader() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child:
                  const Icon(Icons.arrow_back_ios_new, color: _text, size: 18),
            ),
            const Spacer(),
            Text('Profile',
                style: GoogleFonts.inter(
                    color: _text, fontSize: 18, fontWeight: FontWeight.w600)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.more_horiz, color: _text, size: 20),
            ),
          ],
        ),
      );

  Widget _membershipCard() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [_accent, const Color(0xFF818CF8)]),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rawaan',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text('PRO MEMBER',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _iconMenu() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _iconBtn('Wallet', Icons.account_balance_wallet_outlined),
            _iconBtn('History', Icons.history),
            _iconBtn('Saved', Icons.bookmark_outline),
            _iconBtn('Invite', Icons.person_add_outlined),
          ],
        ),
      );

  Widget _iconBtn(String label, IconData icon) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _card, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: _accent, size: 24),
          ),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
        ],
      );

  Widget _settingsList() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _settingTile('Edit Profile', Icons.edit_outlined),
            _settingTile('Security', Icons.shield_outlined),
            _settingTile('Notifications', Icons.notifications_outlined),
            _settingTile('Language', Icons.language),
            _settingTile('Dark Mode', Icons.dark_mode_outlined),
            const SizedBox(height: 16),
            _logoutTile(),
          ],
        ),
      );

  Widget _settingTile(String title, IconData icon) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(icon, color: _accent, size: 22),
            const SizedBox(width: 16),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _logoutTile() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.red[400], size: 22),
            const SizedBox(width: 16),
            Text('Log Out',
                style: GoogleFonts.inter(color: Colors.red[400], fontSize: 15)),
          ],
        ),
      );
}
