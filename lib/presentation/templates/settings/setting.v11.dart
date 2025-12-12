import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v11 - Dark Orange Accent Theme
class SettingV11Screen extends StatefulWidget {
  const SettingV11Screen({super.key});

  @override
  State<SettingV11Screen> createState() => _SettingV11ScreenState();
}

class _SettingV11ScreenState extends State<SettingV11Screen> {
  static const Color _bg = Color(0xFF18120B);
  static const Color _card = Color(0xFF261C10);
  static const Color _accent = Color(0xFFF97316);
  static const Color _text = Color(0xFFFFF7ED);
  static const Color _textSec = Color(0xFFA8A29E);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              _appBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _coverSection(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            _actionButtons(),
                            const SizedBox(height: 28),
                            _menuList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
              child: const Icon(Icons.edit_outlined, color: _text, size: 20),
            ),
          ],
        ),
      );

  Widget _coverSection() => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 40, bottom: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_accent.withOpacity(0.3), _bg]),
        ),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: _accent, width: 3),
                borderRadius: BorderRadius.circular(24),
                color: _card,
              ),
              child: Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _accent,
                          fontSize: 36,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 16),
            Text('Rawaan',
                style: GoogleFonts.inter(
                    color: _text, fontSize: 24, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text('rawaan@email.com',
                style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
          ],
        ),
      );

  Widget _actionButtons() => Row(
        children: [
          Expanded(child: _actionBtn('Share', Icons.share_outlined)),
          const SizedBox(width: 12),
          Expanded(child: _actionBtn('QR Code', Icons.qr_code)),
          const SizedBox(width: 12),
          Expanded(child: _actionBtn('Copy ID', Icons.copy)),
        ],
      );

  Widget _actionBtn(String label, IconData icon) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            Icon(icon, color: _accent, size: 22),
            const SizedBox(height: 8),
            Text(label, style: GoogleFonts.inter(color: _text, fontSize: 12)),
          ],
        ),
      );

  Widget _menuList() => Column(
        children: [
          _menuItem('Account Settings', Icons.person_outline, null),
          _menuItem('Notifications', Icons.notifications_outlined, '3'),
          _menuItem('Appearance', Icons.palette_outlined, null),
          _menuItem('Security', Icons.lock_outline, null),
          _menuItem('Storage', Icons.cloud_outlined, '2.4 GB'),
          _menuItem('Help Center', Icons.help_outline, null),
          const SizedBox(height: 16),
          _logoutBtn(),
        ],
      );

  Widget _menuItem(String title, IconData icon, String? badge) => Container(
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
            if (badge != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: _accent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(badge,
                    style: GoogleFonts.inter(
                        color: _accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ),
            if (badge == null) Icon(Icons.chevron_right, color: _textSec),
          ],
        ),
      );

  Widget _logoutBtn() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: _accent, borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: Text('Sign Out',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600))),
      );
}
