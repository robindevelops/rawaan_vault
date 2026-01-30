import 'package:flutter/material.dart';
import 'foodpanda_restaurant_list.dart';
import 'foodpanda_search.dart';
import 'foodpanda_cart.dart';
import 'foodpanda_orders.dart';
import 'foodpanda_account.dart';

// Original FoodpandaHomeScreen with bottom nav (for backwards compatibility)
class FoodpandaHomeScreen extends StatefulWidget {
  const FoodpandaHomeScreen({super.key});

  @override
  State<FoodpandaHomeScreen> createState() => _FoodpandaHomeScreenState();
}

class _FoodpandaHomeScreenState extends State<FoodpandaHomeScreen> {
  final Color _primaryPink = const Color(0xFFD70F64);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          FoodpandaHomeContent(),
          FoodpandaRestaurantListScreen(),
          FoodpandaOrdersScreen(),
          FoodpandaAccountScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _primaryPink,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted home content widget for use in main navigation
class FoodpandaHomeContent extends StatefulWidget {
  const FoodpandaHomeContent({super.key});

  @override
  State<FoodpandaHomeContent> createState() => _FoodpandaHomeContentState();
}

class _FoodpandaHomeContentState extends State<FoodpandaHomeContent> {
  final Color _primaryPink = const Color(0xFFD70F64);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey, size: 20),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alex Lane',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Current Location',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: _primaryPink),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined,
                          color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodpandaCartScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for shops & restaurants',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    readOnly: true,
                    onTap: () {
                      // Handled by main navigation
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodpandaSearchScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Category Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                  children: [
                    _buildCategoryCard(
                      'Shops',
                      'Groceries and more',
                      Icons.shopping_basket,
                      Colors.orange[100]!,
                      Colors.orange,
                    ),
                    _buildCategoryCard(
                      'Pick-up',
                      'Up to 50% off',
                      Icons.shopping_bag,
                      Colors.blue[100]!,
                      Colors.blue,
                    ),
                    _buildCategoryCard(
                      'pandamart',
                      'Essentials delivered',
                      Icons.store,
                      _primaryPink.withOpacity(0.1),
                      _primaryPink,
                    ),
                    _buildCategoryCard(
                      'Dine-in',
                      '',
                      Icons.restaurant,
                      Colors.grey[200]!,
                      Colors.grey[600]!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Your Restaurants section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Restaurants',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(color: _primaryPink),
                      ),
                    ),
                  ],
                ),
              ),

              // Restaurant cards
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildRestaurantCard(
                      'Jimmy Dim Sum (Jelita)',
                      'Asian, Dim Sum, Breakfast',
                      '30-40 min',
                      '4.4',
                      '(103)',
                    ),
                    _buildRestaurantCard(
                      'Hao Lai Wu Xiang Yang Guo',
                      'Chinese, Asian',
                      '25-35 min',
                      '4.3',
                      '(89)',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Panda picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Panda picks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _primaryPink,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildRestaurantCard(
                      'Hao Lai Wu Xiang Yang Guo',
                      'Chinese, Asian',
                      '25-35 min',
                      '4.3',
                      '(89)',
                      isDeliveryFree: true,
                    ),
                    _buildRestaurantCard(
                      'The Original Taste',
                      'Western, Breakfast',
                      '35-45 min',
                      '4.5',
                      '(156)',
                      isDeliveryFree: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    String title,
    String subtitle,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: iconColor, size: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(
    String name,
    String cuisine,
    String time,
    String rating,
    String reviews, {
    bool isDeliveryFree = false,
  }) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.fastfood,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ),
                if (isDeliveryFree)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _primaryPink,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Free Delivery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  cuisine,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '$rating $reviews',
                      style: const TextStyle(fontSize: 12),
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
}
