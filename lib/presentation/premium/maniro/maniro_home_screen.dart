import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_category_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_product_detail_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_search_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_cart_screen.dart';

/// Maniro Home Screen
/// Features: Popular products, categories, product grid, bottom navigation
class ManiroHomeScreen extends StatefulWidget {
  const ManiroHomeScreen({super.key});

  @override
  State<ManiroHomeScreen> createState() => _ManiroHomeScreenState();
}

class _ManiroHomeScreenState extends State<ManiroHomeScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  int _selectedNavIndex = 0;
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Jacket',
    'Shoes',
    'Jeans',
    'T-shirt',
    'Accessories'
  ];

  final List<PopularProduct> _popularProducts = [
    PopularProduct(
      name: 'Sherpa Coat',
      imageUrl:
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400',
    ),
    PopularProduct(
      name: 'Synergy Buds',
      imageUrl:
          'https://images.unsplash.com/photo-1606220838315-056192d5e927?w=400',
    ),
    PopularProduct(
      name: 'LuxeLoom Tote',
      imageUrl:
          'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
    ),
    PopularProduct(
      name: 'Busket Hat',
      imageUrl:
          'https://images.unsplash.com/photo-1521369909029-2afed882baee?w=400',
    ),
  ];

  final List<Product> _products = [
    Product(
      name: 'Stussy Jacket',
      price: 235.00,
      rating: 4.9,
      reviews: 5231,
      imageUrl:
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400',
    ),
    Product(
      name: 'MWDBL Jacket',
      price: 234.00,
      rating: 4.9,
      reviews: 4928,
      imageUrl:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    ),
    Product(
      name: 'Vintage Denim',
      price: 189.00,
      rating: 4.8,
      reviews: 3421,
      imageUrl:
          'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=400',
    ),
    Product(
      name: 'Urban Blazer',
      price: 299.00,
      rating: 4.7,
      reviews: 2891,
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
    ),
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
                    _buildPopularSection(),
                    const SizedBox(height: 24),
                    _buildCategoryTabs(),
                    const SizedBox(height: 20),
                    _buildProductGrid(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Maniro',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: _primaryBlack,
            ),
          ),
          Row(
            children: [
              _buildHeaderIcon(Icons.search, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManiroSearchScreen(),
                  ),
                );
              }),
              const SizedBox(width: 12),
              _buildHeaderIcon(Icons.chat_bubble_outline,
                  badge: '2', onTap: () {}),
              const SizedBox(width: 12),
              _buildHeaderIcon(Icons.shopping_bag_outlined, badge: '12',
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManiroCartScreen(),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon,
      {String? badge, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
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
            child: Icon(icon, color: _primaryBlack, size: 22),
          ),
          if (badge != null)
            Positioned(
              right: -4,
              top: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: _primaryBlack,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badge,
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
    );
  }

  Widget _buildPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Product',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See More',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _textGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _popularProducts.length,
            itemBuilder: (context, index) {
              return _buildPopularCard(_popularProducts[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCard(PopularProduct product) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                product.name,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(16)),
            child: Image.network(
              product.imageUrl,
              width: 70,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 70,
                height: 120,
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
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? _primaryBlack : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: isSelected ? _primaryBlack : _borderGrey,
                ),
              ),
              child: Center(
                child: Text(
                  _categories[index],
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : _textGrey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(_products[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ManiroProductDetailScreen(product: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _backgroundGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: _backgroundGrey,
                        child: const Center(
                          child:
                              Icon(Icons.image, color: Colors.grey, size: 40),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: _textGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                '${product.rating}',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '(${product.reviews} Reviews)',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: _textGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: _primaryBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
              _buildNavItem(
                  1, Icons.grid_view_outlined, Icons.grid_view, 'Category',
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManiroCategoryScreen(),
                  ),
                );
              }),
              _buildNavItem(
                  2, Icons.favorite_border, Icons.favorite, 'Favorite'),
              _buildNavItem(
                  3, Icons.person_outline, Icons.person, 'My Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index, IconData icon, IconData activeIcon, String label,
      {VoidCallback? onTap}) {
    final isSelected = _selectedNavIndex == index;
    return GestureDetector(
      onTap: onTap ?? () => setState(() => _selectedNavIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? _primaryBlack : _textGrey,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? _primaryBlack : _textGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class PopularProduct {
  final String name;
  final String imageUrl;

  PopularProduct({required this.name, required this.imageUrl});
}

class Product {
  final String name;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });
}
