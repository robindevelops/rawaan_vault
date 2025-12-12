import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Crypto v1 - Dashboard Home (Minimal)
class CryptoV1Screen extends StatefulWidget {
  const CryptoV1Screen({super.key});

  @override
  State<CryptoV1Screen> createState() => _CryptoV1ScreenState();
}

class _CryptoV1ScreenState extends State<CryptoV1Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

  int _navIndex = 0;

  final List<Map<String, dynamic>> _coins = [
    {'name': 'Bitcoin', 'symbol': 'BTC', 'price': 43250.00, 'change': 2.34},
    {'name': 'Ethereum', 'symbol': 'ETH', 'price': 2280.50, 'change': -1.25},
    {'name': 'Solana', 'symbol': 'SOL', 'price': 98.45, 'change': 5.67},
    {'name': 'Cardano', 'symbol': 'ADA', 'price': 0.52, 'change': 0.89},
  ];

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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      _balanceCard(),
                      const SizedBox(height: 24),
                      _actions(),
                      const SizedBox(height: 28),
                      _sectionTitle('Market'),
                      const SizedBox(height: 16),
                      _coinsList(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back',
                      style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
                  Text('Rawaan',
                      style: GoogleFonts.inter(
                          color: _text,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            _iconBtn(Icons.notifications_none),
          ],
        ),
      );

  Widget _iconBtn(IconData i) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(12)),
        child: Icon(i, color: _text, size: 22),
      );

  Widget _balanceCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Balance',
                style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
            const SizedBox(height: 8),
            Text('\$48,250.00',
                style: GoogleFonts.inter(
                    color: _text, fontSize: 32, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.arrow_upward, color: Colors.green[400], size: 16),
                const SizedBox(width: 4),
                Text('+\$5,230.00 (12.5%)',
                    style: GoogleFonts.inter(
                        color: Colors.green[400], fontSize: 13)),
                const SizedBox(width: 8),
                Text('this month',
                    style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
              ],
            ),
          ],
        ),
      );

  Widget _actions() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionBtn('Send', Icons.arrow_upward),
          _actionBtn('Receive', Icons.arrow_downward),
          _actionBtn('Buy', Icons.add),
          _actionBtn('Swap', Icons.swap_horiz),
        ],
      );

  Widget _actionBtn(String l, IconData i) => Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _border)),
            child: Icon(i, color: _text, size: 24),
          ),
          const SizedBox(height: 8),
          Text(l, style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
        ],
      );

  Widget _sectionTitle(String t) => Text(t,
      style: GoogleFonts.inter(
          color: _text, fontSize: 18, fontWeight: FontWeight.w600));

  Widget _coinsList() =>
      Column(children: _coins.map((c) => _coinCard(c)).toList());

  Widget _coinCard(Map<String, dynamic> c) {
    final isUp = c['change'] > 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _border)),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: _bg, borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(c['symbol'][0],
                    style: const TextStyle(
                        color: _text,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c['name'],
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                Text(c['symbol'],
                    style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${c['price'].toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                      color: _text, fontSize: 15, fontWeight: FontWeight.w500)),
              Text('${isUp ? '+' : ''}${c['change']}%',
                  style: GoogleFonts.inter(
                      color: isUp ? Colors.green[400] : Colors.red[400],
                      fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomNav() => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
            color: _card, border: Border(top: BorderSide(color: _border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 'Home', 0),
            _navItem(Icons.pie_chart, 'Portfolio', 1),
            _navItem(Icons.swap_horiz, 'Trade', 2),
            _navItem(Icons.account_balance_wallet, 'Wallet', 3),
          ],
        ),
      );

  Widget _navItem(IconData i, String l, int idx) => GestureDetector(
        onTap: () => setState(() => _navIndex = idx),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(i, color: _navIndex == idx ? _text : _textSec, size: 24),
            const SizedBox(height: 4),
            Text(l,
                style: GoogleFonts.inter(
                    color: _navIndex == idx ? _text : _textSec, fontSize: 11)),
          ],
        ),
      );
}
