import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cart v10 - Dark Mode Premium Layout
/// Professional dark theme with elegant styling
class CartV10Screen extends StatefulWidget {
  const CartV10Screen({super.key});

  @override
  State<CartV10Screen> createState() => _CartV10ScreenState();
}

class _CartV10ScreenState extends State<CartV10Screen> {
  static const Color _bg = Color(0xFF121212);
  static const Color _card = Color(0xFF1E1E1E);
  static const Color _cardLight = Color(0xFF2A2A2A);
  static const Color _accent = Color(0xFF818CF8);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFF71717A);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Premium Leather Jacket',
      'brand': 'Urban Edge',
      'price': 389.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=15',
      'size': 'L'
    },
    {
      'name': 'Designer Denim Jeans',
      'brand': 'Raw Craft',
      'price': 179.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=16',
      'size': '32'
    },
    {
      'name': 'Classic White Sneakers',
      'brand': 'StepUp',
      'price': 159.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=17',
      'size': 'US 10'
    },
  ];

  double get _subtotal =>
      _cartItems.fold(0, (s, i) => s + (i['price'] * i['qty']));
  double get _total => _subtotal;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        ..._cartItems
                            .asMap()
                            .entries
                            .map((e) => _buildPremiumItem(e.value, e.key)),
                        const SizedBox(height: 28),
                        _buildPromoInput(),
                        const SizedBox(height: 24),
                        _buildSummaryCard(),
                        const SizedBox(height: 100),
                      ]),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: _buildCheckoutBar(),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: _card, borderRadius: BorderRadius.circular(14)),
            child: Icon(Icons.arrow_back_ios_new, size: 18, color: _text),
          ),
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Your Bag',
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.w800, color: _text)),
            Text('${_cartItems.length} items',
                style: GoogleFonts.inter(fontSize: 13, color: _textSecondary)),
          ]),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
                color: _accent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              Icon(Icons.local_shipping_outlined, size: 16, color: _accent),
              const SizedBox(width: 6),
              Text('Free Ship',
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _accent)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumItem(Map<String, dynamic> item, int idx) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: _card, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: _cardLight,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage(item['image']), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                      child: Text(item['brand'],
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _accent,
                              letterSpacing: 0.5))),
                  GestureDetector(
                      onTap: () => setState(() => _cartItems.removeAt(idx)),
                      child:
                          Icon(Icons.close, size: 18, color: _textSecondary)),
                ],
              ),
              const SizedBox(height: 4),
              Text(item['name'],
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w600, color: _text)),
              const SizedBox(height: 4),
              Text('Size: ${item['size']}',
                  style:
                      GoogleFonts.inter(fontSize: 12, color: _textSecondary)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${item['price'].toStringAsFixed(0)}',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: _text)),
                  Container(
                    decoration: BoxDecoration(
                        color: _cardLight,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            if (item['qty'] > 1)
                              setState(() => _cartItems[idx]['qty']--);
                          },
                          child: Container(
                              width: 34,
                              height: 34,
                              alignment: Alignment.center,
                              child: Icon(Icons.remove,
                                  size: 16, color: _textSecondary))),
                      Container(
                          width: 34,
                          alignment: Alignment.center,
                          child: Text('${item['qty']}',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: _text))),
                      GestureDetector(
                          onTap: () => setState(() => _cartItems[idx]['qty']++),
                          child: Container(
                              width: 34,
                              height: 34,
                              alignment: Alignment.center,
                              child:
                                  Icon(Icons.add, size: 16, color: _accent))),
                    ]),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoInput() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration:
          BoxDecoration(color: _card, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(Icons.discount_outlined, color: _textSecondary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: GoogleFonts.inter(color: _text, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Promo code',
                hintStyle:
                    GoogleFonts.inter(color: _textSecondary, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
                color: _accent, borderRadius: BorderRadius.circular(12)),
            child: Text('Apply',
                style: GoogleFonts.inter(
                    color: _bg, fontWeight: FontWeight.w700, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: _card, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        _row('Subtotal', '\$${_subtotal.toStringAsFixed(0)}'),
        const SizedBox(height: 12),
        _row('Shipping', 'Free', highlight: true),
        const SizedBox(height: 12),
        _row('Tax', '\$${(_subtotal * 0.085).toStringAsFixed(2)}'),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Color(0xFF3F3F46))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total',
              style: GoogleFonts.inter(
                  fontSize: 17, fontWeight: FontWeight.w700, color: _text)),
          Text('\$${(_total + _subtotal * 0.085).toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                  fontSize: 24, fontWeight: FontWeight.w800, color: _text)),
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
                color: highlight ? _accent : _text)),
      ]);

  Widget _buildCheckoutBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: _bg, border: Border(top: BorderSide(color: _card))),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: _accent,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: _accent.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 8))
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Checkout',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _bg)),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: _bg, size: 20),
                      ]),
                )),
          ),
        ),
      ),
    );
  }
}
