import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_product_detail_screen.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_home_screen.dart';

/// Maniro Search Screen
/// Features: Search bar, recent searches, trending, category filters, search results
class ManiroSearchScreen extends StatefulWidget {
  const ManiroSearchScreen({super.key});

  @override
  State<ManiroSearchScreen> createState() => _ManiroSearchScreenState();
}

class _ManiroSearchScreenState extends State<ManiroSearchScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  bool _isSearching = false;
  int _selectedFilterIndex = 0;

  final List<String> _recentSearches = [
    'Leather jacket',
    'Nike sneakers',
    'Denim jeans',
    'Summer dresses',
  ];

  final List<String> _trendingSearches = [
    '🔥 Varsity Jacket',
    '👟 Running Shoes',
    '👜 Tote Bags',
    '🧢 Bucket Hats',
    '👔 Casual Shirts',
  ];

  final List<String> _filters = [
    'All',
    'Jackets',
    'Shoes',
    'Bags',
    'Accessories'
  ];

  final List<SearchProduct> _searchResults = [
    SearchProduct(
      name: 'DR CRZ Jacket',
      category: 'Leather Jacket',
      price: 235.00,
      rating: 4.9,
      reviews: 1283,
      imageUrl:
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400',
    ),
    SearchProduct(
      name: 'Stussy Jacket',
      category: 'Jackets',
      price: 235.00,
      rating: 4.9,
      reviews: 5231,
      imageUrl:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    ),
    SearchProduct(
      name: 'MWDBL Jacket',
      category: 'Varsity Jacket',
      price: 234.00,
      rating: 4.9,
      reviews: 4928,
      imageUrl:
          'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=400',
    ),
    SearchProduct(
      name: 'Nike Tech Hera',
      category: 'Sneakers',
      price: 458.00,
      rating: 4.9,
      reviews: 9823,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    ),
    SearchProduct(
      name: 'Nike Phoenix Waffle',
      category: 'Sneakers',
      price: 456.00,
      rating: 4.8,
      reviews: 8273,
      imageUrl:
          'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400',
    ),
    SearchProduct(
      name: 'LuxeLoom Tote',
      category: 'Bags',
      price: 189.00,
      rating: 4.7,
      reviews: 3412,
      imageUrl:
          'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchHeader(),
            if (!_isSearching) ...[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRecentSearches(),
                      const SizedBox(height: 24),
                      _buildTrendingSearches(),
                      const SizedBox(height: 24),
                      _buildPopularCategories(),
                    ],
                  ),
                ),
              ),
            ] else ...[
              _buildFilterChips(),
              Expanded(child: _buildSearchResults()),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader() {
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
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: _backgroundGrey,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: _searchController,
                // focusNode: _searchFocus,
                onChanged: (value) {
                  setState(() => _isSearching = value.isNotEmpty);
                },
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: _primaryBlack,
                ),
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 15,
                    color: _textGrey,
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: _textGrey, size: 22),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            setState(() => _isSearching = false);
                          },
                          child: const Icon(Icons.close,
                              color: _textGrey, size: 20),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _primaryBlack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Searches',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _recentSearches.clear()),
                child: Text(
                  'Clear All',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _textGrey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _recentSearches.map((search) {
              return GestureDetector(
                onTap: () {
                  _searchController.text = search;
                  setState(() => _isSearching = true);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: _backgroundGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.history, size: 18, color: _textGrey),
                      const SizedBox(width: 8),
                      Text(
                        search,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: _primaryBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingSearches() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Now',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(_trendingSearches.length, (index) {
            return GestureDetector(
              onTap: () {
                _searchController.text = _trendingSearches[index]
                    .replaceAll(RegExp(r'[^\w\s]'), '')
                    .trim();
                setState(() => _isSearching = true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: _borderGrey.withValues(alpha: 0.5)),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${index + 1}',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _textGrey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _trendingSearches[index],
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: _primaryBlack,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.trending_up,
                        size: 20, color: Colors.green),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPopularCategories() {
    final categories = [
      {'name': 'Jackets', 'icon': Icons.checkroom, 'count': '234'},
      {'name': 'Sneakers', 'icon': Icons.sports_basketball, 'count': '567'},
      {'name': 'Bags', 'icon': Icons.shopping_bag_outlined, 'count': '123'},
      {'name': 'Accessories', 'icon': Icons.watch, 'count': '89'},
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Categories',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _backgroundGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(category['icon'] as IconData,
                        color: _primaryBlack, size: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category['name'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _primaryBlack,
                          ),
                        ),
                        Text(
                          category['count'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: _textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedFilterIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = index),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
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
                  _filters[index],
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

  Widget _buildSearchResults() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_searchResults[index]);
      },
    );
  }

  Widget _buildProductCard(SearchProduct product) {
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
              Expanded(
                child: Text(
                  '(${product.reviews})',
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

class SearchProduct {
  final String name;
  final String category;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;

  SearchProduct({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });
}
