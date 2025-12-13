import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_explore_screen.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_product_detail_screen.dart';
import 'package:rawaan_vault/presentation/premium/loza/loza_profile_screen.dart';

/// LOZA Discover/Home Screen
/// Features: Location, Search, Banner, Categories, Flash Sale, Products, Bottom Nav
class LozaDiscoverScreen extends StatefulWidget {
  const LozaDiscoverScreen({super.key});

  @override
  State<LozaDiscoverScreen> createState() => _LozaDiscoverScreenState();
}

class _LozaDiscoverScreenState extends State<LozaDiscoverScreen> {
  static const Color _primaryTeal = Color(0xFF2D4F4F);
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF5F5F5);
  static const Color _borderGrey = Color(0xFFE5E7EB);
  int _selectedTab = 1; // "Newest" selected by default
  int _selectedBottomTab = 0; // "Newest" selected by default

  final List<String> _filterTabs = ['All', 'Newest', 'Popular', 'Bedroom'];

  final List<CategoryItem> _categories = [
    CategoryItem(name: 'Sofa', icon: Icons.weekend_outlined),
    CategoryItem(name: 'Chair', icon: Icons.chair_outlined),
    CategoryItem(name: 'Lamp', icon: Icons.lightbulb_outline),
    CategoryItem(name: 'Cupboard', icon: Icons.kitchen_outlined),
  ];

  final List<ProductItem> _products = [
    ProductItem(
      name: 'Modern Accent Chair',
      price: 180.00,
      imageUrl:
          'https://images.unsplash.com/photo-1567538096621-38d2284b23ff?w=400',
    ),
    ProductItem(
      name: 'Plaid Armchair',
      price: 120.00,
      imageUrl:
          'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=400',
    ),
    ProductItem(
      name: 'Velvet Lounge Chair',
      price: 220.00,
      imageUrl:
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400',
    ),
    ProductItem(
      name: 'Wooden Dining Chair',
      price: 95.00,
      imageUrl:
          'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                _selectedBottomTab == 0
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              _buildHeader(),
                              const SizedBox(height: 16),
                              _buildSearchBar(),
                              const SizedBox(height: 20),
                              _buildBanner(),
                              const SizedBox(height: 24),
                              _buildCategories(),
                              const SizedBox(height: 24),
                              _buildFlashSaleHeader(),
                              const SizedBox(height: 16),
                              _buildFilterTabs(),
                              const SizedBox(height: 16),
                              _buildProductGrid(),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )
                    : _selectedBottomTab == 1
                        ? const Expanded(child: LozaExploreScreen())
                        : const Expanded(child: LozaProfileScreen()),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            // Adding a subtle top border for separation instead of a heavy shadow
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
            ),
            child: BottomNavigationBar(
              // 1. Remove standard elevation
              currentIndex: _selectedBottomTab,
              onTap: (index) {
                setState(() {
                  _selectedBottomTab = index;
                });
              },
              elevation: 0,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black, // Sharp, dark active color
              unselectedItemColor: Colors.grey.shade600, // Soft inactive color

              selectedFontSize: 12,
              unselectedFontSize: 12,

              // TRICK: Hide unselected labels for a cleaner look
              showUnselectedLabels: false,
              showSelectedLabels: true, // Only show label when active

              // 4. Icons (Use Outlined for inactive, Filled for active)
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house),
                  activeIcon: Icon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.explosion),
                  activeIcon: Icon(FontAwesomeIcons.explosion),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user),
                  activeIcon: Icon(FontAwesomeIcons.user),
                  label: 'Profile',
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: _textGrey,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: _primaryTeal),
                  const SizedBox(width: 4),
                  Text(
                    'New York, USA',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _primaryBlack,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down,
                      size: 18, color: _primaryBlack),
                ],
              ),
            ],
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _primaryTeal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.notifications_outlined,
                color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: _backgroundGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Icon(Icons.search, color: _textGrey, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Furniture',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: _textGrey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _primaryTeal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(16),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
                width: 160,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 160,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New Collection',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: _primaryBlack,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Discount 50% for\nthe first transaction',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: _textGrey,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: _primaryTeal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Shop Now',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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

  Widget _buildCategories() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _primaryBlack,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: _primaryTeal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _categories
                .map(
                  (category) => _buildCategoryItem(category),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(CategoryItem category) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: _backgroundGrey,
            shape: BoxShape.circle,
          ),
          child: Icon(category.icon, size: 28, color: _primaryTeal),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _primaryBlack,
          ),
        ),
      ],
    );
  }

  Widget _buildFlashSaleHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Flash Sale',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: _primaryBlack,
            ),
          ),
          Row(
            children: [
              Text(
                'Closing in : ',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: _textGrey,
                ),
              ),
              _buildTimeBox('02'),
              Text(' : ',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
              _buildTimeBox('12'),
              Text(' : ',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
              _buildTimeBox('56'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        time,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: _primaryBlack,
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            _filterTabs.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: _selectedTab == index ? _primaryTeal : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _selectedTab == index ? _primaryTeal : _borderGrey,
                    ),
                  ),
                  child: Text(
                    _filterTabs[index],
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color:
                          _selectedTab == index ? Colors.white : _primaryBlack,
                    ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) => _buildProductCard(_products[index]),
      ),
    );
  }

  Widget _buildProductCard(ProductItem product) {
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
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: _backgroundGrey,
                        child: Icon(Icons.image, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(Icons.favorite_border,
                          size: 18, color: _textGrey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _primaryBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _primaryTeal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final IconData icon;

  CategoryItem({required this.name, required this.icon});
}

class ProductItem {
  final String name;
  final double price;
  final String imageUrl;

  ProductItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
