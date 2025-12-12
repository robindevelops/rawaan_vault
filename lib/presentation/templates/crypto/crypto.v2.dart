import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Crypto v2 - Portfolio View (Minimal)
class CryptoV2Screen extends StatefulWidget {
  const CryptoV2Screen({super.key});

  @override
  State<CryptoV2Screen> createState() => _CryptoV2ScreenState();
}

class _CryptoV2ScreenState extends State<CryptoV2Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

  final List<Map<String, dynamic>> _assets = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'amount': 0.85,
      'value': 36762.50,
      'change': 3.2,
      'pct': 45
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'amount': 12.5,
      'value': 28506.25,
      'change': -1.8,
      'pct': 35
    },
    {
      'name': 'Solana',
      'symbol': 'SOL',
      'amount': 85.0,
      'value': 8365.00,
      'change': 8.5,
      'pct': 20
    },
  ];

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
                _totalCard(),
                const SizedBox(height: 24),
                _timeFilter(),
                const SizedBox(height: 28),
                _assetsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        children: [
          Text('Portfolio',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 28, fontWeight: FontWeight.w700)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: _card, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.tune, color: _text, size: 20),
          ),
        ],
      );

  Widget _totalCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _border)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Value',
                      style: GoogleFonts.inter(color: _textSec, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text('\$73,633.75',
                      style: GoogleFonts.inter(
                          color: _text,
                          fontSize: 28,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward,
                          color: Colors.green[400], size: 14),
                      Text(' +\$4,230 this week',
                          style: GoogleFonts.inter(
                              color: Colors.green[400], fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CustomPaint(painter: _DonutPainter(_assets)),
            ),
          ],
        ),
      );

  Widget _timeFilter() {
    final filters = ['24H', '1W', '1M', '1Y'];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration:
          BoxDecoration(color: _card, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: filters.map((f) {
          final sel = f == '1W';
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: sel ? _text : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(f,
                      style: GoogleFonts.inter(
                          color: sel ? _bg : _textSec,
                          fontSize: 13,
                          fontWeight:
                              sel ? FontWeight.w600 : FontWeight.normal))),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _assetsList() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Assets',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          ..._assets.map((a) => _assetCard(a)),
        ],
      );

  Widget _assetCard(Map<String, dynamic> a) {
    final isUp = a['change'] > 0;
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: _bg, borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(a['symbol'][0],
                    style: const TextStyle(
                        color: _text,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(a['name'],
                    style: GoogleFonts.inter(
                        color: _text,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                Text('${a['amount']} ${a['symbol']}',
                    style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${a['value'].toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                      color: _text, fontSize: 15, fontWeight: FontWeight.w500)),
              Text('${isUp ? '+' : ''}${a['change']}%',
                  style: GoogleFonts.inter(
                      color: isUp ? Colors.green[400] : Colors.red[400],
                      fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;
  _DonutPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const stroke = 12.0;
    double start = -math.pi / 2;
    final colors = [Colors.white, Colors.white54, Colors.white24];

    for (int i = 0; i < data.length; i++) {
      final sweep = 2 * math.pi * (data[i]['pct'] / 100);
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius - stroke / 2),
          start,
          sweep - 0.08,
          false,
          paint);
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
