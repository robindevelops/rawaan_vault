import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Crypto v4 - Wallet Screen (Minimal)
class CryptoV4Screen extends StatefulWidget {
  const CryptoV4Screen({super.key});

  @override
  State<CryptoV4Screen> createState() => _CryptoV4ScreenState();
}

class _CryptoV4ScreenState extends State<CryptoV4Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

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
                _walletCard(),
                const SizedBox(height: 24),
                _actions(),
                const SizedBox(height: 28),
                _txList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        children: [
          Text('Wallet',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 28, fontWeight: FontWeight.w700)),
          const Spacer(),
          _iconBtn(Icons.qr_code),
          const SizedBox(width: 12),
          _iconBtn(Icons.more_horiz),
        ],
      );

  Widget _iconBtn(IconData i) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(12)),
        child: Icon(i, color: _text, size: 20),
      );

  Widget _walletCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _border)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: _textSec, size: 20),
                const SizedBox(width: 8),
                Text('Main Wallet',
                    style: GoogleFonts.inter(
                        color: _text, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 20),
            Text('Total Balance',
                style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
            const SizedBox(height: 6),
            Text('\$48,256.80',
                style: GoogleFonts.inter(
                    color: _text, fontSize: 32, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: _bg, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('0x7a2f...9b3c',
                      style:
                          GoogleFonts.firaCode(color: _textSec, fontSize: 13)),
                  const SizedBox(width: 8),
                  Icon(Icons.copy, color: _textSec, size: 16),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _actions() => Row(
        children: [
          Expanded(child: _actionBtn('Send', Icons.arrow_upward)),
          const SizedBox(width: 12),
          Expanded(child: _actionBtn('Receive', Icons.arrow_downward)),
          const SizedBox(width: 12),
          Expanded(child: _actionBtn('Buy', Icons.add)),
        ],
      );

  Widget _actionBtn(String l, IconData i) => Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _border)),
        child: Column(
          children: [
            Icon(i, color: _text, size: 24),
            const SizedBox(height: 8),
            Text(l, style: GoogleFonts.inter(color: _text, fontSize: 14)),
          ],
        ),
      );

  Widget _txList() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Recent',
                  style: GoogleFonts.inter(
                      color: _text, fontSize: 18, fontWeight: FontWeight.w600)),
              const Spacer(),
              Text('See All',
                  style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          _txItem('Received BTC', '+0.025 BTC', '2h ago', true),
          _txItem('Sent ETH', '-1.5 ETH', '5h ago', false),
          _txItem('Received SOL', '+25.0 SOL', 'Yesterday', true),
        ],
      );

  Widget _txItem(String t, String a, String time, bool isIn) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _border)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _bg, borderRadius: BorderRadius.circular(10)),
              child: Icon(isIn ? Icons.arrow_downward : Icons.arrow_upward,
                  color: _text, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
                child: Text(t,
                    style: GoogleFonts.inter(
                        color: _text, fontWeight: FontWeight.w500))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(a,
                    style: GoogleFonts.inter(
                        color: isIn ? Colors.green[400] : Colors.red[400],
                        fontWeight: FontWeight.w600)),
                Text(time,
                    style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
              ],
            ),
          ],
        ),
      );
}
