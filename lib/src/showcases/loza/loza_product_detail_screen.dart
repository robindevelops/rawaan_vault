import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_cart_screen.dart';

/// LOZA Product Detail Screen
/// Features: Product image, title, price, description, quantity selector, add to cart
class LozaProductDetailScreen extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final double? productPrice;

  const LozaProductDetailScreen({
    super.key,
    this.productName,
    this.productImage,
    this.productPrice,
  });

  @override
  State<LozaProductDetailScreen> createState() =>
      _LozaProductDetailScreenState();
}

class _LozaProductDetailScreenState extends State<LozaProductDetailScreen> {
  static const Color _primaryTeal = Color(0xFF2D4F4F);
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF5F5F5);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  int _quantity = 1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final productName = widget.productName ?? 'Modern Accent Chair';
    final productImage = widget.productImage ??
        'https://images.unsplash.com/photo-1567538096621-38d2284b23ff?w=800';
    final productPrice = widget.productPrice ?? 180.00;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image Section
                  _buildImageSection(productImage),
                  const SizedBox(height: 24),
                  // Product Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Favorite
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                productName,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: _primaryBlack,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() => _isFavorite = !_isFavorite),
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: _backgroundGrey,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavorite ? Colors.red : _textGrey,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Rating
                        Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      size: 18,
                                      color: index < 4
                                          ? Colors.amber
                                          : _borderGrey,
                                    )),
                            const SizedBox(width: 8),
                            Text(
                              '4.8 (128 reviews)',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: _textGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Price
                        Text(
                          '\$${productPrice.toStringAsFixed(2)}',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: _primaryTeal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Description
                        Text(
                          'Description',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _primaryBlack,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This elegant accent chair combines modern design with supreme comfort. Crafted with premium materials and featuring a sleek silhouette, it\'s perfect for any living space.',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: _textGrey,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Color Options
                        Text(
                          'Color',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _primaryBlack,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildColorOption(const Color(0xFF4A4A4A), true),
                            _buildColorOption(const Color(0xFFB8860B), false),
                            _buildColorOption(const Color(0xFF8B4513), false),
                            _buildColorOption(const Color(0xFF2F4F4F), false),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Quantity Selector
                        Row(
                          children: [
                            Text(
                              'Quantity',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _primaryBlack,
                              ),
                            ),
                            const SizedBox(width: 20),
                            _buildQuantitySelector(),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Actions
          _buildBottomActions(productPrice),
        ],
      ),
    );
  }

  Widget _buildImageSection(String imageUrl) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          color: _backgroundGrey,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: _backgroundGrey,
              child: Icon(Icons.image, size: 80, color: Colors.grey[400]),
            ),
          ),
        ),
        // Back Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child:
                  const Icon(Icons.arrow_back, color: _primaryBlack, size: 22),
            ),
          ),
        ),
        // Cart Icon
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LozaCartScreen()),
              );
            },
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(Icons.shopping_bag_outlined,
                  color: _primaryBlack, size: 22),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorOption(Color color, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: _primaryTeal, width: 3) : null,
      ),
      child: isSelected
          ? const Icon(Icons.check, color: Colors.white, size: 18)
          : null,
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _borderGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (_quantity > 1) setState(() => _quantity--);
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Icon(Icons.remove,
                  color: _quantity > 1 ? _primaryBlack : _borderGrey),
            ),
          ),
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              '$_quantity',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _primaryBlack,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _quantity++),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: const Icon(Icons.add, color: _primaryBlack),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(double price) {
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
        child: Row(
          children: [
            // Total
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: _textGrey,
                  ),
                ),
                Text(
                  '\$${(price * _quantity).toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: _primaryBlack,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
            // Add to Cart Button
            Expanded(
              child: SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LozaCartScreen()),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_bag_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Add to Cart',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
