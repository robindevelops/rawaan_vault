import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Crypto v5 - Trading/Exchange (Minimal)
class CryptoV5Screen extends StatefulWidget {
  const CryptoV5Screen({super.key});

  @override
  State<CryptoV5Screen> createState() => _CryptoV5ScreenState();
}

class _CryptoV5ScreenState extends State<CryptoV5Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

  bool _isBuy = true;

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
              children: [
                _header(),
                const SizedBox(height: 24),
                _toggle(),
                const SizedBox(height: 24),
                _swapCard(),
                const SizedBox(height: 20),
                _priceInfo(),
                const SizedBox(height: 24),
                _tradeBtn(),
                const SizedBox(height: 28),
                _orderBook(),
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: _card, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.arrow_back_ios_new, color: _text, size: 18),
          ),
          const Spacer(),
          Text('Exchange',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 18, fontWeight: FontWeight.w600)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: _card, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.history, color: _text, size: 20),
          ),
        ],
      );

  Widget _toggle() => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(child: _toggleBtn('Buy', true)),
            Expanded(child: _toggleBtn('Sell', false)),
          ],
        ),
      );

  Widget _toggleBtn(String l, bool isBuy) => GestureDetector(
        onTap: () => setState(() => _isBuy = isBuy),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
              color: _isBuy == isBuy ? _text : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(l,
                  style: GoogleFonts.inter(
                      color: _isBuy == isBuy ? _bg : _textSec,
                      fontSize: 15,
                      fontWeight: FontWeight.w600))),
        ),
      );

  Widget _swapCard() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _border)),
        child: Column(
          children: [
            _coinInput('From', 'USDT', '1,000.00'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _bg,
                  shape: BoxShape.circle,
                  border: Border.all(color: _border, width: 3)),
              child: const Icon(Icons.swap_vert, color: _text, size: 20),
            ),
            const SizedBox(height: 12),
            _coinInput('To', 'BTC', '0.0231'),
          ],
        ),
      );

  Widget _coinInput(String label, String coin, String amount) => Container(
        padding: const EdgeInsets.all(16),
        decoration:
            BoxDecoration(color: _bg, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: GoogleFonts.inter(color: _textSec, fontSize: 12)),
                  const SizedBox(height: 6),
                  Text(amount,
                      style: GoogleFonts.inter(
                          color: _text,
                          fontSize: 22,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Text(coin,
                      style: GoogleFonts.inter(
                          color: _text, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 6),
                  Icon(Icons.keyboard_arrow_down, color: _textSec, size: 20),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _priceInfo() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 BTC = 43,256.80 USDT',
                style: GoogleFonts.inter(color: _text, fontSize: 13)),
            Text('Fee: \$2.50',
                style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
          ],
        ),
      );

  Widget _tradeBtn() => Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
            color: _text, borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: Text(_isBuy ? 'Buy BTC' : 'Sell BTC',
                style: GoogleFonts.inter(
                    color: _bg, fontSize: 16, fontWeight: FontWeight.w700))),
      );

  Widget _orderBook() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Book',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: _orderCol(
                      'Bids',
                      Colors.green[400]!,
                      ['43,250', '43,248', '43,245'],
                      ['0.52', '1.23', '0.89'])),
              const SizedBox(width: 12),
              Expanded(
                  child: _orderCol(
                      'Asks',
                      Colors.red[400]!,
                      ['43,258', '43,260', '43,265'],
                      ['0.78', '0.45', '1.56'])),
            ],
          ),
        ],
      );

  Widget _orderCol(
          String t, Color c, List<String> prices, List<String> amounts) =>
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: _card, borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t,
                style: GoogleFonts.inter(
                    color: c, fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            for (int i = 0; i < prices.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(prices[i],
                        style: GoogleFonts.inter(color: c, fontSize: 13)),
                    Text(amounts[i],
                        style:
                            GoogleFonts.inter(color: _textSec, fontSize: 13)),
                  ],
                ),
              ),
          ],
        ),
      );
}
