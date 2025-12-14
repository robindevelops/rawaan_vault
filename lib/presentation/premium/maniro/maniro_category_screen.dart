import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_product_detail_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_home_screen.dart';

/// Maniro Category Screen
/// Features: Category tabs (Sneakers, Boots, etc.), product grid with prices
class ManiroCategoryScreen extends StatefulWidget {
  const ManiroCategoryScreen({super.key});

  @override
  State<ManiroCategoryScreen> createState() => _ManiroCategoryScreenState();
}

class _ManiroCategoryScreenState extends State<ManiroCategoryScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);

  int _selectedCategoryIndex = 0;

  final List<String> _categories = ['Sneakers', 'Boots', 'Formals', 'Runners'];

  final List<CategoryProduct> _sneakers = [
    CategoryProduct(
      name: 'Nike Tech Hera',
      price: 458.00,
      rating: 4.9,
      reviews: 9823,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    ),
    CategoryProduct(
      name: 'Nike Phoenix Waffle',
      price: 456.00,
      rating: 4.8,
      reviews: 8273,
      imageUrl:
          'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400',
    ),
    CategoryProduct(
      name: 'Jordan Retro',
      price: 389.00,
      rating: 4.9,
      reviews: 7123,
      imageUrl:
          'https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?w=400',
    ),
    CategoryProduct(
      name: 'New Balance 550',
      price: 320.00,
      rating: 4.7,
      reviews: 5892,
      imageUrl:
          'https://images.unsplash.com/photo-1539185441755-769473a23570?w=400',
    ),
    CategoryProduct(
      name: 'Adidas Ultraboost',
      price: 410.00,
      rating: 4.8,
      reviews: 6421,
      imageUrl:
          'https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?w=400',
    ),
    CategoryProduct(
      name: 'Puma RS-X',
      price: 275.00,
      rating: 4.6,
      reviews: 4231,
      imageUrl:
          'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildCategoryTabs(),
            Expanded(
              child: _buildProductGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 46,
      margin: const EdgeInsets.only(bottom: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? _primaryBlack : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected ? _primaryBlack : const Color(0xFFE5E7EB),
                  width: 1,
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
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        childAspectRatio: 0.68,
      ),
      itemCount: _sneakers.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_sneakers[index]);
      },
    );
  }

  Widget _buildProductCard(CategoryProduct product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ManiroProductDetailScreen(
              product: Product(
                name: product.name,
                price: product.price,
                rating: product.rating,
                reviews: product.reviews,
                imageUrl: product.imageUrl,
              ),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Expanded(
            child: Container(
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
                      child: Icon(Icons.image, color: Colors.grey, size: 40),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
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
              Expanded(
                child: Text(
                  '(${product.reviews} Reviews)',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: _textGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
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
}

class CategoryProduct {
  final String name;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;

  CategoryProduct({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });
}
