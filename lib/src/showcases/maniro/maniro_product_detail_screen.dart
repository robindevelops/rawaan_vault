import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/maniro/maniro_home_screen.dart';
import 'package:rawaan_vault/src/showcases/maniro/maniro_cart_screen.dart';

/// Maniro Product Detail Screen
/// Features: Product image gallery, product info, rating, add to cart
class ManiroProductDetailScreen extends StatefulWidget {
  final Product product;

  const ManiroProductDetailScreen({super.key, required this.product});

  @override
  State<ManiroProductDetailScreen> createState() =>
      _ManiroProductDetailScreenState();
}

class _ManiroProductDetailScreenState extends State<ManiroProductDetailScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  int _selectedImageIndex = 0;
  int _selectedSizeIndex = 1;
  int _quantity = 1;

  final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  List<String> get _productImages => [
        widget.product.imageUrl,
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
        'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400',
        'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=400',
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400',
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMainImage(),
                    const SizedBox(height: 16),
                    _buildImageGallery(),
                    const SizedBox(height: 24),
                    _buildProductInfo(),
                    const SizedBox(height: 24),
                    _buildSizeSelector(),
                    const SizedBox(height: 24),
                    _buildQuantitySelector(),
                    const SizedBox(height: 24),
                    _buildDescription(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _backgroundGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child:
                  const Icon(Icons.arrow_back, color: _primaryBlack, size: 22),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              widget.product.name,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: _primaryBlack,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManiroCartScreen(),
                ),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: _backgroundGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.shopping_bag_outlined,
                      color: _primaryBlack, size: 22),
                ),
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '12',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainImage() {
    return Container(
      height: 350,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              _productImages[_selectedImageIndex],
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: _backgroundGrey,
                child: const Center(
                  child: Icon(Icons.image, color: Colors.grey, size: 60),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.zoom_out_map,
                  color: _primaryBlack, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGallery() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _productImages.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedImageIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedImageIndex = index),
            child: Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? _primaryBlack : _borderGrey,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  _productImages[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: _backgroundGrey,
                    child:
                        const Icon(Icons.image, color: Colors.grey, size: 24),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Leather Jacket',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: _textGrey,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < 4 ? Colors.amber : const Color(0xFFE5E7EB),
                  size: 20,
                );
              }),
              const SizedBox(width: 8),
              Text(
                '${widget.product.rating}',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '(${widget.product.reviews} Reviews)',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: _textGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSizeSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Size',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(_sizes.length, (index) {
              final isSelected = _selectedSizeIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedSizeIndex = index),
                child: Container(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? _primaryBlack : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? _primaryBlack : _borderGrey,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _sizes[index],
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : _primaryBlack,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Quantity',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: _backgroundGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_quantity > 1) {
                      setState(() => _quantity--);
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.remove,
                        color: _primaryBlack, size: 20),
                  ),
                ),
                Container(
                  width: 48,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        const Icon(Icons.add, color: _primaryBlack, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Premium quality jacket crafted with genuine leather. Features a modern design with detailed stitching and durable construction. Perfect for casual outings and everyday wear.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: _textGrey,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: _textGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${(widget.product.price * _quantity).toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: _primaryBlack,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManiroCartScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined, size: 22),
                  label: Text(
                    'Add to Cart',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryBlack,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
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
