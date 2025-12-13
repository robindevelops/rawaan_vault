import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_product_detail_screen.dart';

/// LOZA Explore Screen
/// Features: Discount banner, category tabs, masonry product grid
class LozaExploreScreen extends StatefulWidget {
  const LozaExploreScreen({super.key});

  @override
  State<LozaExploreScreen> createState() => _LozaExploreScreenState();
}

class _LozaExploreScreenState extends State<LozaExploreScreen> {
  static const Color _primaryTeal = Color(0xFF2D4F4F);
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF5F5F5);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  int _selectedCategory = 0;

  final List<String> _categories = [
    'All Categories',
    'Chairs',
    'Tables',
    'Lamps',
    'Decor',
  ];

  final List<ExploreProduct> _products = [
    ExploreProduct(
      name: 'Modern Accent Chair',
      price: 180.00,
      rating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1567538096621-38d2284b23ff?w=400',
      isLarge: true,
    ),
    ExploreProduct(
      name: 'Geometric Lamp',
      price: 95.00,
      rating: 4.7,
      imageUrl:
          'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=400',
      isLarge: false,
    ),
    ExploreProduct(
      name: 'Wood Side Table',
      price: 120.00,
      rating: 4.9,
      imageUrl:
          'https://images.unsplash.com/photo-1499933374294-4584851497cc?w=400',
      isLarge: false,
    ),
    ExploreProduct(
      name: 'Velvet Armchair',
      price: 250.00,
      rating: 4.6,
      imageUrl:
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400',
      isLarge: true,
    ),
    ExploreProduct(
      name: 'Pendant Light',
      price: 85.00,
      rating: 4.5,
      imageUrl:
          'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?w=400',
      isLarge: false,
    ),
    ExploreProduct(
      name: 'Console Table',
      price: 320.00,
      rating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
      isLarge: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildCategoryTabs(),
                    const SizedBox(height: 20),
                    _buildProductGrid(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discount 50% OFF',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: _primaryBlack,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '#Furniture Sale',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _primaryTeal,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose your furniture category!',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: _textGrey,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=300',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(
          _categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => setState(() => _selectedCategory = index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color:
                      _selectedCategory == index ? _primaryTeal : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color:
                        _selectedCategory == index ? _primaryTeal : _borderGrey,
                  ),
                ),
                child: Text(
                  _categories[index],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _selectedCategory == index
                        ? Colors.white
                        : _primaryBlack,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column
          Expanded(
            child: Column(
              children: _products
                  .asMap()
                  .entries
                  .where((e) => e.key % 2 == 0)
                  .map((e) => _buildProductCard(e.value, e.key))
                  .toList(),
            ),
          ),
          const SizedBox(width: 12),
          // Right Column
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 30), // Offset for masonry effect
                ..._products
                    .asMap()
                    .entries
                    .where((e) => e.key % 2 == 1)
                    .map((e) => _buildProductCard(e.value, e.key))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(ExploreProduct product, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LozaProductDetailScreen(
              productName: product.name,
              productImage: product.imageUrl,
              productPrice: product.price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                product.imageUrl,
                height: product.isLarge ? 200 : 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: product.isLarge ? 200 : 150,
                  color: _backgroundGrey,
                  child: Icon(Icons.image, color: Colors.grey[400], size: 40),
                ),
              ),
            ),
            // Product Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price and Rating Row
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(0)}',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: _primaryBlack,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.star, size: 14, color: Colors.amber[600]),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _textGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Product Name
                  Text(
                    product.name,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _textGrey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: _borderGrey, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _primaryTeal,
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: 1, // Explore tab selected
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ExploreProduct {
  final String name;
  final double price;
  final double rating;
  final String imageUrl;
  final bool isLarge;

  ExploreProduct({
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isLarge = false,
  });
}
