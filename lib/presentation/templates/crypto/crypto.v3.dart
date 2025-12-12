import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Crypto v3 - Coin Detail Page (Minimal)
class CryptoV3Screen extends StatefulWidget {
  const CryptoV3Screen({super.key});

  @override
  State<CryptoV3Screen> createState() => _CryptoV3ScreenState();
}

class _CryptoV3ScreenState extends State<CryptoV3Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

  String _period = '1W';

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
                    children: [
                      const SizedBox(height: 20),
                      _price(),
                      const SizedBox(height: 28),
                      _chart(),
                      const SizedBox(height: 20),
                      _periods(),
                      const SizedBox(height: 28),
                      _stats(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: _actions(),
      ),
    );
  }

  Widget _header() => Padding(
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
            const SizedBox(width: 16),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text('B',
                      style: TextStyle(
                          color: _text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bitcoin',
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                Text('BTC',
                    style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.star_border, color: _text, size: 20),
            ),
          ],
        ),
      );

  Widget _price() => Column(
        children: [
          Text('\$43,256.80',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 36, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_upward, color: Colors.green[400], size: 16),
              Text(' +\$1,234.50 (2.94%)',
                  style: GoogleFonts.inter(
                      color: Colors.green[400], fontSize: 14)),
              const SizedBox(width: 8),
              Text('Today',
                  style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
            ],
          ),
        ],
      );

  Widget _chart() => SizedBox(
        height: 180,
        child: CustomPaint(painter: _ChartPainter(), size: Size.infinite),
      );

  Widget _periods() {
    final items = ['1H', '1D', '1W', '1M', '1Y'];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration:
          BoxDecoration(color: _card, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: items.map((p) {
          final sel = _period == p;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _period = p),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: sel ? _text : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(p,
                        style: GoogleFonts.inter(
                            color: sel ? _bg : _textSec,
                            fontSize: 13,
                            fontWeight:
                                sel ? FontWeight.w600 : FontWeight.normal))),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _stats() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _border)),
        child: Column(
          children: [
            _statRow('Market Cap', '\$845.2B'),
            _statRow('Volume (24H)', '\$28.5B'),
            _statRow('Circulating', '19.5M BTC'),
            _statRow('Max Supply', '21M BTC'),
          ],
        ),
      );

  Widget _statRow(String l, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l, style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
            Text(v,
                style: GoogleFonts.inter(
                    color: _text, fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      );

  Widget _actions() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _bg, border: Border(top: BorderSide(color: _border))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(color: _text),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text('Sell',
                        style: GoogleFonts.inter(
                            color: _text,
                            fontSize: 15,
                            fontWeight: FontWeight.w600))),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    color: _text, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text('Buy',
                        style: GoogleFonts.inter(
                            color: _bg,
                            fontSize: 15,
                            fontWeight: FontWeight.w600))),
              ),
            ),
          ],
        ),
      );
}

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white.withOpacity(0.2), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final rand = math.Random(42);
    final pts = <Offset>[];
    for (int i = 0; i <= 20; i++) {
      pts.add(Offset(size.width * i / 20,
          size.height * 0.2 + rand.nextDouble() * size.height * 0.6));
    }

    final fillPath = Path()..moveTo(0, size.height);
    for (final p in pts) fillPath.lineTo(p.dx, p.dy);
    fillPath.lineTo(size.width, size.height);
    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);

    final linePath = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (int i = 1; i < pts.length; i++) linePath.lineTo(pts[i].dx, pts[i].dy);
    canvas.drawPath(linePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
