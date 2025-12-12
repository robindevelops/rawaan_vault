import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v9 - Dark Green Accent Theme
class SettingV9Screen extends StatefulWidget {
  const SettingV9Screen({super.key});

  @override
  State<SettingV9Screen> createState() => _SettingV9ScreenState();
}

class _SettingV9ScreenState extends State<SettingV9Screen> {
  static const Color _bg = Color(0xFF0A0F0D);
  static const Color _card = Color(0xFF141F1A);
  static const Color _accent = Color(0xFF22C55E);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF6B7280);

  bool _biometric = true;
  bool _notifications = true;

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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _balanceCard(),
                      const SizedBox(height: 24),
                      _securitySection(),
                      const SizedBox(height: 20),
                      _menuSection(),
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

  Widget _header() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: _accent, width: 2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _accent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rawaan',
                      style: GoogleFonts.inter(
                          color: _text,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Text('Premium Plan',
                      style: GoogleFonts.inter(color: _accent, fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child: Icon(Icons.settings, color: _text, size: 22),
            ),
          ],
        ),
      );

  Widget _balanceCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _accent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Available Balance',
                    style:
                        GoogleFonts.inter(color: Colors.white70, fontSize: 14)),
                Icon(Icons.visibility_outlined,
                    color: Colors.white70, size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Text('\$24,580.00',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _cardBtn('Deposit', Icons.add)),
                const SizedBox(width: 12),
                Expanded(child: _cardBtn('Withdraw', Icons.arrow_upward)),
              ],
            ),
          ],
        ),
      );

  Widget _cardBtn(String label, IconData icon) => Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(label,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      );

  Widget _securitySection() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Security',
                style: GoogleFonts.inter(
                    color: _text, fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            _toggleItem('Biometric Login', Icons.fingerprint, _biometric,
                (v) => setState(() => _biometric = v)),
            _toggleItem('Push Notifications', Icons.notifications_outlined,
                _notifications, (v) => setState(() => _notifications = v)),
          ],
        ),
      );

  Widget _toggleItem(
          String title, IconData icon, bool value, Function(bool) onChanged) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Icon(icon, color: _accent, size: 22),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title,
                    style: GoogleFonts.inter(color: _text, fontSize: 15))),
            Switch(
                value: value,
                onChanged: onChanged,
                activeColor: _accent,
                activeTrackColor: _accent.withOpacity(0.3)),
          ],
        ),
      );

  Widget _menuSection() => Column(
        children: [
          _menuItem('Account Details', Icons.person_outline),
          _menuItem('Payment Methods', Icons.credit_card_outlined),
          _menuItem('Transaction History', Icons.history),
          _menuItem('Help & Support', Icons.help_outline),
          const SizedBox(height: 16),
          _logoutItem(),
        ],
      );

  Widget _menuItem(String title, IconData icon) => Container(
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.red[400], size: 22),
            const SizedBox(width: 14),
            Text('Log Out',
                style: GoogleFonts.inter(color: Colors.red[400], fontSize: 15)),
          ],
        ),
      );
}
