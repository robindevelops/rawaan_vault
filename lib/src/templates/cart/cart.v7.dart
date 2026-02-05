import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cart v7 - Swipeable Cards Layout
/// Professional design with swipe-to-delete functionality
class CartV7Screen extends StatefulWidget {
  const CartV7Screen({super.key});

  @override
  State<CartV7Screen> createState() => _CartV7ScreenState();
}

class _CartV7ScreenState extends State<CartV7Screen> {
  static const Color _bg = Color(0xFFFAFBFC);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _primary = Color(0xFF0F172A);
  static const Color _accent = Color(0xFF0EA5E9);
  static const Color _danger = Color(0xFFEF4444);
  static const Color _textPrimary = Color(0xFF0F172A);
  static const Color _textSecondary = Color(0xFF94A3B8);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'MacBook Air M2',
      'brand': 'Apple',
      'price': 1199.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=60'
    },
    {
      'name': 'Magic Keyboard',
      'brand': 'Apple',
      'price': 299.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=61'
    },
    {
      'name': 'Studio Display',
      'brand': 'Apple',
      'price': 1599.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=62'
    },
  ];

  double get _subtotal =>
      _cartItems.fold(0, (s, i) => s + (i['price'] * i['qty']));
  double get _total => _subtotal;

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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Swipe left to remove',
                            style: GoogleFonts.inter(
                                fontSize: 13, color: _textSecondary)),
                        const SizedBox(height: 16),
                        ..._cartItems
                            .asMap()
                            .entries
                            .map((e) => _buildSwipeableItem(e.value, e.key)),
                        const SizedBox(height: 32),
                        _buildPromoSection(),
                        const SizedBox(height: 24),
                        _buildTotalSection(),
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04), blurRadius: 8)
                ]),
            child:
                const Icon(Icons.arrow_back_ios_new, size: 18, color: _primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text('Cart',
                style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: _textPrimary)),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04), blurRadius: 8)
                ]),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.shopping_bag_outlined,
                    size: 22, color: _primary),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                        color: _accent, shape: BoxShape.circle),
                    child: Center(
                        child: Text('${_cartItems.length}',
                            style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeableItem(Map<String, dynamic> item, int idx) {
    return Dismissible(
      key: Key('${item['name']}_$idx'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => setState(() => _cartItems.removeAt(idx)),
      background: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: _danger, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 26),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4))
            ]),
        child: Row(
          children: [
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: _bg,
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: NetworkImage(item['image']),
                        fit: BoxFit.cover))),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['brand'],
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _accent)),
                    const SizedBox(height: 4),
                    Text(item['name'],
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: _textPrimary)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${item['price'].toStringAsFixed(0)}',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: _primary)),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE2E8F0)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            GestureDetector(
                                onTap: () {
                                  if (item['qty'] > 1)
                                    setState(() => _cartItems[idx]['qty']--);
                                },
                                child: Container(
                                    width: 32,
                                    height: 32,
                                    alignment: Alignment.center,
                                    child: Icon(Icons.remove,
                                        size: 16, color: _textSecondary))),
                            Container(
                                width: 32,
                                alignment: Alignment.center,
                                child: Text('${item['qty']}',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: _textPrimary))),
                            GestureDetector(
                                onTap: () =>
                                    setState(() => _cartItems[idx]['qty']++),
                                child: Container(
                                    width: 32,
                                    height: 32,
                                    alignment: Alignment.center,
                                    child: Icon(Icons.add,
                                        size: 16, color: _accent))),
                          ]),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Row(
        children: [
          Icon(Icons.confirmation_number_outlined, color: _accent, size: 22),
          const SizedBox(width: 12),
          Expanded(
              child: Text('Add promo code',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _textSecondary))),
          Icon(Icons.chevron_right, color: _textSecondary, size: 22),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Subtotal',
            style: GoogleFonts.inter(fontSize: 15, color: _textSecondary)),
        Text('\$${_subtotal.toStringAsFixed(0)}',
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: _textPrimary)),
      ]),
      const SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Shipping',
            style: GoogleFonts.inter(fontSize: 15, color: _textSecondary)),
        Text('Free',
            style: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w600, color: _accent)),
      ]),
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Divider(color: Color(0xFFE2E8F0))),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Total',
            style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: _textPrimary)),
        Text('\$${_total.toStringAsFixed(0)}',
            style: GoogleFonts.inter(
                fontSize: 24, fontWeight: FontWeight.w800, color: _primary)),
      ]),
    ]);
  }

  Widget _buildCheckoutBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: _card, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4))
      ]),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: _primary, borderRadius: BorderRadius.circular(16)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Proceed to Checkout',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward,
                            color: Colors.white, size: 20),
                      ]),
                )),
          ),
        ),
      ),
    );
  }
}
