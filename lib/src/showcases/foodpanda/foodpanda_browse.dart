import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// --- Configuration & Theme ---
const Color kPrimaryPink = Color(0xFFD70F64);
const Color kSurfaceGrey = Color(0xFFF7F7F7);

class Cuisine {
  final String name;
  final String icon;
  final int count;
  Cuisine({required this.name, required this.icon, required this.count});
}

// --- Main Screen ---
class FoodpandaBrowseScreen extends StatefulWidget {
  const FoodpandaBrowseScreen({super.key});

  @override
  State<FoodpandaBrowseScreen> createState() => _FoodpandaBrowseScreenState();
}

class _FoodpandaBrowseScreenState extends State<FoodpandaBrowseScreen> {
  int _selectedCuisineIndex = 0;

  final List<Cuisine> _cuisines = [
    Cuisine(name: 'American', icon: '🍔', count: 42),
    Cuisine(name: 'Italian', icon: '🍕', count: 28),
    Cuisine(name: 'Japanese', icon: '🍣', count: 35),
    Cuisine(name: 'Korean', icon: '🍜', count: 19),
    Cuisine(name: 'Indian', icon: '🍛', count: 54),
    Cuisine(name: 'Desserts', icon: '🍰', count: 22),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SearchBarSection(),
            _buildPromoSlider(),
            _SectionHeader(title: 'Delicious lunch ideas', onSeeAll: () {}),
            _buildCuisineSlider(),
            const SizedBox(height: 12),
            _SectionHeader(title: 'Panda picks', hasTag: true, onSeeAll: () {}),
            _buildRestaurantList(),
          ],
        ),
      ),
    );
  }

  // --- UI Methods ---

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 16,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restaurant Delivery',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900),
          ),
          Row(
            children: [
              Text(
                'Current Location',
                style: TextStyle(
                    color: kPrimaryPink,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const Icon(Icons.keyboard_arrow_down,
                  size: 18, color: kPrimaryPink),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.favorite_border,
                color: Colors.black, size: 22),
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.shopping_bag_outlined,
                color: Colors.black, size: 22),
            onPressed: () {}),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildPromoSlider() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: const [
          _PromoCard(
              title: '20% OFF',
              subtitle: 'On your first order!',
              color: kPrimaryPink),
          _PromoCard(
              title: 'Free Delivery',
              subtitle: 'Select restaurants',
              color: Color(0xFF1C1C1C)),
        ],
      ),
    );
  }

  Widget _buildCuisineSlider() {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _cuisines.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _CuisineCard(
          cuisine: _cuisines[index],
          isSelected: _selectedCuisineIndex == index,
          onTap: () {
            setState(() => _selectedCuisineIndex = index);
            HapticFeedback.selectionClick();
          },
        ),
      ),
    );
  }

  Widget _buildRestaurantList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) => const _RestaurantCard(),
    );
  }
}

// --- Sub-Widgets ---

class _SearchBarSection extends StatelessWidget {
  const _SearchBarSection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  color: kSurfaceGrey, borderRadius: BorderRadius.circular(24)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants, dishes...',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Icon(Icons.tune, color: kPrimaryPink, size: 24),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool hasTag;
  final VoidCallback onSeeAll;

  const _SectionHeader(
      {required this.title, this.hasTag = false, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5)),
                if (hasTag) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        color: kPrimaryPink,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text('Free Delivery',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ]
              ],
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text('See all',
                style: TextStyle(
                    color: kPrimaryPink,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class _CuisineCard extends StatelessWidget {
  final Cuisine cuisine;
  final bool isSelected;
  final VoidCallback onTap;

  const _CuisineCard(
      {required this.cuisine, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryPink : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: isSelected ? kPrimaryPink : Colors.grey.shade200,
              width: 1.5),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: kPrimaryPink.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4))
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cuisine.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(cuisine.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.black87)),
            Text('${cuisine.count} places',
                style: TextStyle(
                    fontSize: 10,
                    color: isSelected ? Colors.white70 : Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String title, subtitle;
  final Color color;
  const _PromoCard(
      {required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900)),
          Text(subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  const _RestaurantCard();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: const Center(
              child: Icon(Icons.fastfood, size: 40, color: Colors.grey)),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Panda Kitchen',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 16),
                Text(' 4.8',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
          ],
        ),
        const Text('\$\$ • Western • 20 min',
            style: TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}
