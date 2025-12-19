import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cart v9 - Stepper Progress Layout
/// Professional design with checkout progress indicator
class CartV9Screen extends StatefulWidget {
  const CartV9Screen({super.key});

  @override
  State<CartV9Screen> createState() => _CartV9ScreenState();
}

class _CartV9ScreenState extends State<CartV9Screen> {
  static const Color _bg = Color(0xFFFCFCFD);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _primary = Color(0xFF18181B);
  static const Color _accent = Color(0xFF16A34A);
  static const Color _textPrimary = Color(0xFF18181B);
  static const Color _textSecondary = Color(0xFFA1A1AA);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Organic Coffee Beans',
      'brand': 'Mountain Roast',
      'price': 24.00,
      'qty': 2,
      'image': 'https://i.pravatar.cc/150?img=80',
      'weight': '250g'
    },
    {
      'name': 'Green Tea Collection',
      'brand': 'Zen Garden',
      'price': 32.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=81',
      'weight': '100g x 5'
    },
    {
      'name': 'Honey Jar Set',
      'brand': 'BeeNatural',
      'price': 45.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=82',
      'weight': '3 x 200g'
    },
  ];

  double get _subtotal =>
      _cartItems.fold(0, (s, i) => s + (i['price'] * i['qty']));
  double get _total => _subtotal + 5.99;

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
              _buildProgressStepper(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Review Your Order',
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: _textPrimary)),
                        const SizedBox(height: 6),
                        Text('${_cartItems.length} items in your cart',
                            style: GoogleFonts.inter(
                                fontSize: 14, color: _textSecondary)),
                        const SizedBox(height: 20),
                        ..._cartItems
                            .asMap()
                            .entries
                            .map((e) => _buildCartCard(e.value, e.key)),
                        const SizedBox(height: 24),
                        _buildPaymentSummary(),
                        const SizedBox(height: 100),
                      ]),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: _buildContinueBar(),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE4E4E7))),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 16, color: _primary),
            ),
          ),
          const Spacer(),
          Text('Checkout',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary)),
          const Spacer(),
          Container(width: 42, height: 42),
        ],
      ),
    );
  }

  Widget _buildProgressStepper() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        children: [
          _stepCircle(1, 'Cart', true),
          Expanded(child: Container(height: 2, color: _accent)),
          _stepCircle(2, 'Shipping', false),
          Expanded(child: Container(height: 2, color: const Color(0xFFE4E4E7))),
          _stepCircle(3, 'Payment', false),
        ],
      ),
    );
  }

  Widget _stepCircle(int num, String label, bool active) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: active ? _accent : _bg,
            shape: BoxShape.circle,
            border: Border.all(
                color: active ? _accent : const Color(0xFFE4E4E7), width: 2),
          ),
          child: Center(
              child: active
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : Text('$num',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _textSecondary))),
        ),
        const SizedBox(height: 6),
        Text(label,
            style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                color: active ? _accent : _textSecondary)),
      ],
    );
  }

  Widget _buildCartCard(Map<String, dynamic> item, int idx) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFF4F4F5))),
      child: Row(
        children: [
          Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  color: _bg,
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: NetworkImage(item['image']), fit: BoxFit.cover))),
          const SizedBox(width: 14),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item['name'],
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: _textPrimary)),
              const SizedBox(height: 4),
              Text('${item['brand']} • ${item['weight']}',
                  style:
                      GoogleFonts.inter(fontSize: 12, color: _textSecondary)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: _bg, borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            if (item['qty'] > 1)
                              setState(() => _cartItems[idx]['qty']--);
                          },
                          child: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: Icon(Icons.remove,
                                  size: 14, color: _textSecondary))),
                      Container(
                          width: 28,
                          alignment: Alignment.center,
                          child: Text('${item['qty']}',
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: _textPrimary))),
                      GestureDetector(
                          onTap: () => setState(() => _cartItems[idx]['qty']++),
                          child: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child:
                                  Icon(Icons.add, size: 14, color: _accent))),
                    ]),
                  ),
                  const Spacer(),
                  Text('\$${(item['price'] * item['qty']).toStringAsFixed(2)}',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: _primary)),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFF4F4F5))),
      child: Column(children: [
        _summaryRow('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
        const SizedBox(height: 10),
        _summaryRow('Delivery', '\$5.99'),
        const SizedBox(height: 10),
        _summaryRow('Discount', '-\$0.00'),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(color: Color(0xFFF4F4F5))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Order Total',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: _textPrimary)),
          Text('\$${_total.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                  fontSize: 22, fontWeight: FontWeight.w800, color: _accent)),
        ]),
      ]),
    );
  }

  Widget _summaryRow(String l, String v) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(l, style: GoogleFonts.inter(fontSize: 14, color: _textSecondary)),
        Text(v,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textPrimary)),
      ]);

  Widget _buildContinueBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: _card, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -4))
      ]),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
              color: _accent, borderRadius: BorderRadius.circular(14)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Center(
                  child: Text('Continue to Shipping',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                )),
          ),
        ),
      ),
    );
  }
}
