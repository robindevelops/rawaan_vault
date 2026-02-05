import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_checkout_screen.dart';

/// LOZA Cart Screen
/// Features: Cart items list, quantity adjustment, order summary, checkout button
class LozaCartScreen extends StatefulWidget {
  const LozaCartScreen({super.key});

  @override
  State<LozaCartScreen> createState() => _LozaCartScreenState();
}

class _LozaCartScreenState extends State<LozaCartScreen> {
  static const Color _primaryTeal = Color(0xFF2D4F4F);
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF5F5F5);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  final List<CartItem> _cartItems = [
    CartItem(
      name: 'Modern Accent Chair',
      price: 180.00,
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1567538096621-38d2284b23ff?w=400',
    ),
    CartItem(
      name: 'Wooden Side Table',
      price: 95.00,
      quantity: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1499933374294-4584851497cc?w=400',
    ),
    CartItem(
      name: 'Floor Lamp',
      price: 120.00,
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=400',
    ),
  ];

  double get _subtotal =>
      _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get _shipping => 15.00;
  double get _total => _subtotal + _shipping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: _primaryBlack),
        ),
        title: Text(
          'My Cart',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _primaryBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_cartItems.length} items',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: _textGrey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) =>
                  _buildCartItem(_cartItems[index], index),
            ),
          ),
          _buildOrderSummary(),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderGrey),
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imageUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 90,
                height: 90,
                color: _backgroundGrey,
                child: Icon(Icons.image, color: Colors.grey[400]),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: _primaryBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _primaryTeal,
                  ),
                ),
                const SizedBox(height: 12),
                // Quantity Controls
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (item.quantity > 1) {
                          setState(() => item.quantity--);
                        }
                      },
                    ),
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: Text(
                        '${item.quantity}',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: _primaryBlack,
                        ),
                      ),
                    ),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () => setState(() => item.quantity++),
                    ),
                    const Spacer(),
                    // Delete Button
                    GestureDetector(
                      onTap: () => setState(
                        () => _cartItems.removeAt(index),
                      ),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.delete_outline,
                            color: Colors.red.shade400, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: _backgroundGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: _primaryBlack),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            // Promo Code
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: _backgroundGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Promo Code',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: _textGrey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: _primaryTeal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Apply',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Summary Lines
            _buildSummaryRow('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            _buildSummaryRow('Shipping', '\$${_shipping.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            _buildSummaryRow('Total', '\$${_total.toStringAsFixed(2)}',
                isTotal: true),
            const SizedBox(height: 20),
            // Checkout Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LozaCheckoutScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryTeal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Proceed to Checkout',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: isTotal ? _primaryBlack : _textGrey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isTotal ? 20 : 14,
            fontWeight: FontWeight.w700,
            color: isTotal ? _primaryTeal : _primaryBlack,
          ),
        ),
      ],
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
