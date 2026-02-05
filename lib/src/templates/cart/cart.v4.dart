import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cart v4 - Sage Green Cart Screen
/// Professional design with organic sage green tones
class CartV4Screen extends StatefulWidget {
  const CartV4Screen({super.key});

  @override
  State<CartV4Screen> createState() => _CartV4ScreenState();
}

class _CartV4ScreenState extends State<CartV4Screen> {
  static const Color _bg = Color(0xFFF6F8F5);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _primary = Color(0xFF3D5A47);
  static const Color _accent = Color(0xFF7BA38C);
  static const Color _textPrimary = Color(0xFF2D3B32);
  static const Color _textSecondary = Color(0xFF8D9B91);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Organic Face Moisturizer',
      'brand': 'Pure Botanics',
      'price': 68.00,
      'quantity': 1,
      'image': 'https://i.pravatar.cc/150?img=30',
      'color': '50ml Jar',
    },
    {
      'name': 'Natural Hair Serum',
      'brand': 'GreenLeaf',
      'price': 42.00,
      'quantity': 2,
      'image': 'https://i.pravatar.cc/150?img=31',
      'color': '30ml Bottle',
    },
    {
      'name': 'Bamboo Skincare Set',
      'brand': 'Eco Beauty',
      'price': 125.00,
      'quantity': 1,
      'image': 'https://i.pravatar.cc/150?img=32',
      'color': '5 Piece Set',
    },
  ];

  double get _subtotal => _cartItems.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity']));
  double get _shipping => _subtotal > 100 ? 0 : 8.99;
  double get _tax => _subtotal * 0.06;
  double get _total => _subtotal + _shipping + _tax;

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
                      _buildCartItemsList(),
                      const SizedBox(height: 24),
                      _buildPromoCode(),
                      const SizedBox(height: 24),
                      _buildOrderSummary(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: _buildCheckoutButton(),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _bg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _card,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child:
                const Icon(Icons.arrow_back_ios_new, size: 18, color: _primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Bag',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                ),
                Text(
                  '${_cartItems.length} products',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: _textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _accent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.eco_outlined, size: 16, color: _primary),
                const SizedBox(width: 6),
                Text(
                  'Eco-Friendly',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList() {
    return Column(
      children: _cartItems.asMap().entries.map((entry) {
        return _buildCartItem(entry.value, entry.key);
      }).toList(),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: _bg,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(item['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['brand'],
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: _accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['name'],
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item['color'],
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: _textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item['price'].toStringAsFixed(2)}',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: _primary,
                      ),
                    ),
                    _buildQuantityControl(item, index),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(Map<String, dynamic> item, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (item['quantity'] > 1) {
                setState(() => _cartItems[index]['quantity']--);
              }
            },
            child: Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              child: Icon(Icons.remove, size: 18, color: _textPrimary),
            ),
          ),
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Text(
              '${item['quantity']}',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _textPrimary,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() => _cartItems[index]['quantity']++);
            },
            child: Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              child: Icon(Icons.add, size: 18, color: _textPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCode() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(Icons.redeem_outlined, color: _textSecondary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Have a coupon code?',
                hintStyle: GoogleFonts.inter(
                  color: _textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: _primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Apply',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
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
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details',
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: _textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          _buildSummaryRow('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          _buildSummaryRow(
            'Delivery',
            _shipping == 0 ? 'FREE' : '\$${_shipping.toStringAsFixed(2)}',
            isHighlighted: _shipping == 0,
          ),
          const SizedBox(height: 12),
          _buildSummaryRow('Tax', '\$${_tax.toStringAsFixed(2)}'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Color(0xFFE8E8E8)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary,
                ),
              ),
              Text(
                '\$${_total.toStringAsFixed(2)}',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: _primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isHighlighted = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _textSecondary,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isHighlighted ? _accent : _textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _card,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: _primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _primary.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to Checkout',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward,
                        color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
