import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cart v8 - Split View Layout
/// Professional design with summary always visible on the side
class CartV8Screen extends StatefulWidget {
  const CartV8Screen({super.key});

  @override
  State<CartV8Screen> createState() => _CartV8ScreenState();
}

class _CartV8ScreenState extends State<CartV8Screen> {
  static const Color _bg = Color(0xFFF8F9FB);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _primary = Color(0xFF1E293B);
  static const Color _accent = Color(0xFF8B5CF6);
  static const Color _textPrimary = Color(0xFF1E293B);
  static const Color _textSecondary = Color(0xFF64748B);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Ceramic Vase',
      'brand': 'Artisan Home',
      'price': 89.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=70'
    },
    {
      'name': 'Linen Throw Pillow',
      'brand': 'Cozy Living',
      'price': 45.00,
      'qty': 2,
      'image': 'https://i.pravatar.cc/150?img=71'
    },
    {
      'name': 'Wooden Photo Frame',
      'brand': 'Frame Studio',
      'price': 35.00,
      'qty': 3,
      'image': 'https://i.pravatar.cc/150?img=72'
    },
    {
      'name': 'Scented Candle Set',
      'brand': 'Aroma Works',
      'price': 55.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=73'
    },
  ];

  double get _subtotal =>
      _cartItems.fold(0, (s, i) => s + (i['price'] * i['qty']));
  double get _total => _subtotal + 9.99;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDeliveryBanner(),
                        const SizedBox(height: 20),
                        Text('Your Items (${_cartItems.length})',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _textPrimary)),
                        const SizedBox(height: 16),
                        ..._cartItems
                            .asMap()
                            .entries
                            .map((e) => _buildItemRow(e.value, e.key)),
                        const SizedBox(height: 24),
                        _buildOrderSummary(),
                        const SizedBox(height: 20),
                        _buildCheckoutButton(),
                        const SizedBox(height: 20),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: _bg,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04), blurRadius: 8)
                ]),
            child:
                const Icon(Icons.arrow_back_ios_new, size: 16, color: _primary),
          ),
          const SizedBox(width: 16),
          Text('My Cart',
              style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: _textPrimary)),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: Text('Clear All',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _accent))),
        ],
      ),
    );
  }

  Widget _buildDeliveryBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: _accent.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: _accent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12)),
            child:
                Icon(Icons.local_shipping_outlined, color: _accent, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Free Delivery',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _textPrimary)),
              const SizedBox(height: 2),
              Text('Orders over \$100 qualify',
                  style:
                      GoogleFonts.inter(fontSize: 12, color: _textSecondary)),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
                color: _accent, borderRadius: BorderRadius.circular(8)),
            child: Text(
                _subtotal >= 100
                    ? 'Applied!'
                    : '\$${(100 - _subtotal).toStringAsFixed(0)} more',
                style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(Map<String, dynamic> item, int idx) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
          ]),
      child: Row(
        children: [
          Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: _bg,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(item['image']), fit: BoxFit.cover))),
          const SizedBox(width: 14),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item['name'],
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _textPrimary)),
              const SizedBox(height: 2),
              Text(item['brand'],
                  style:
                      GoogleFonts.inter(fontSize: 12, color: _textSecondary)),
            ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('\$${(item['price'] * item['qty']).toStringAsFixed(2)}',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _primary)),
            const SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                  color: _bg, borderRadius: BorderRadius.circular(6)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                GestureDetector(
                    onTap: () {
                      if (item['qty'] > 1)
                        setState(() => _cartItems[idx]['qty']--);
                    },
                    child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Icon(Icons.remove,
                            size: 12, color: _textSecondary))),
                Container(
                    width: 24,
                    alignment: Alignment.center,
                    child: Text('${item['qty']}',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _textPrimary))),
                GestureDetector(
                    onTap: () => setState(() => _cartItems[idx]['qty']++),
                    child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Icon(Icons.add, size: 12, color: _accent))),
              ]),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
          ]),
      child: Column(children: [
        _row('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
        const SizedBox(height: 10),
        _row('Shipping', _subtotal >= 100 ? 'FREE' : '\$9.99',
            highlight: _subtotal >= 100),
        const SizedBox(height: 10),
        _row('Tax', '\$${(_subtotal * 0.08).toStringAsFixed(2)}'),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(color: Color(0xFFE2E8F0))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total',
              style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: _textPrimary)),
          Text(
              '\$${(_subtotal >= 100 ? _subtotal + _subtotal * 0.08 : _total + _subtotal * 0.08).toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                  fontSize: 22, fontWeight: FontWeight.w800, color: _primary)),
        ]),
      ]),
    );
  }

  Widget _row(String l, String v, {bool highlight = false}) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(l, style: GoogleFonts.inter(fontSize: 14, color: _textSecondary)),
        Text(v,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: highlight ? _accent : _textPrimary)),
      ]);

  Widget _buildCheckoutButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          color: _primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: _primary.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 6))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.lock_outline, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text('Secure Checkout',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ]),
            )),
      ),
    );
  }
}
