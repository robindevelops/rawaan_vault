import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_checkout_screen.dart';

/// Maniro Cart Screen
/// Features: Cart items list, quantity controls, order summary, checkout button
class ManiroCartScreen extends StatefulWidget {
  const ManiroCartScreen({super.key});

  @override
  State<ManiroCartScreen> createState() => _ManiroCartScreenState();
}

class _ManiroCartScreenState extends State<ManiroCartScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  final List<CartItem> _cartItems = [
    CartItem(
      name: 'DR CRZ Jacket',
      category: 'Leather Jacket',
      price: 235.00,
      size: 'L',
      color: 'Black',
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400',
    ),
    CartItem(
      name: 'Nike Tech Hera',
      category: 'Sneakers',
      price: 458.00,
      size: '42',
      color: 'Black',
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    ),
    CartItem(
      name: 'MWDBL Jacket',
      category: 'Varsity Jacket',
      price: 234.00,
      size: 'M',
      color: 'Green',
      quantity: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    ),
  ];

  double get _subtotal =>
      _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get _shipping => 15.00;
  double get _tax => _subtotal * 0.08;
  double get _total => _subtotal + _shipping + _tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: _cartItems.isEmpty
                ? _buildEmptyCart()
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(_cartItems[index], index);
                    },
                  ),
          ),
          if (_cartItems.isNotEmpty) _buildOrderSummary(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_back, color: _primaryBlack),
        ),
      ),
      title: Text(
        'My Cart',
        style: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: _primaryBlack,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _backgroundGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_cartItems.length} items',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _textGrey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 24),
          Text(
            'Your cart is empty',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Add items to get started',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: _textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Dismissible(
      key: Key(item.name + index.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.delete_outline,
          color: Colors.red.shade400,
          size: 28,
        ),
      ),
      onDismissed: (direction) {
        setState(() => _cartItems.removeAt(index));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _borderGrey),
        ),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 100,
                  height: 100,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _primaryBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.category} • Size: ${item.size}',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: _textGrey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: _primaryBlack,
                        ),
                      ),
                      // Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          color: _backgroundGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
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
                              width: 32,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
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
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_offer_outlined,
                      color: _textGrey, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter promo code',
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
                      color: _primaryBlack,
                      borderRadius: BorderRadius.circular(10),
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
            _buildSummaryRow('Tax', '\$${_tax.toStringAsFixed(2)}'),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            _buildSummaryRow('Total', '\$${_total.toStringAsFixed(2)}',
                isTotal: true),
            const SizedBox(height: 20),
            // Checkout Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManiroCheckoutScreen(total: _total),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryBlack,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to Checkout',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 20),
                  ],
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
            fontSize: isTotal ? 22 : 14,
            fontWeight: FontWeight.w700,
            color: _primaryBlack,
          ),
        ),
      ],
    );
  }
}

class CartItem {
  final String name;
  final String category;
  final double price;
  final String size;
  final String color;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.category,
    required this.price,
    required this.size,
    required this.color,
    required this.quantity,
    required this.imageUrl,
  });
}
