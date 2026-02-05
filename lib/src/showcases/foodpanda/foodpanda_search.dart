import 'package:flutter/material.dart';

class FoodpandaSearchScreen extends StatefulWidget {
  const FoodpandaSearchScreen({super.key});

  @override
  State<FoodpandaSearchScreen> createState() => _FoodpandaSearchScreenState();
}

class _FoodpandaSearchScreenState extends State<FoodpandaSearchScreen> {
  final Color _primaryPink = const Color(0xFFD70F64);
  final TextEditingController _searchController = TextEditingController();

  final List<String> _recentSearches = [
    'Burger',
    'Pizza',
    'Sushi',
    'Salad',
  ];

  final List<String> _popularCuisines = [
    'Chinese',
    'Italian',
    'Japanese',
    'Mexican',
    'Indian',
    'Thai',
    'American',
    'Korean',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // automaticallyImplyLeading: false,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for restaurants, dishes...',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recent Searches
            if (_recentSearches.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear all',
                      style: TextStyle(
                        color: _primaryPink,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...List.generate(
                _recentSearches.length,
                (index) => _buildSearchItem(
                  _recentSearches[index],
                  Icons.history,
                  isRecent: true,
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Popular Cuisines
            const Text(
              'Popular Cuisines',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _popularCuisines.map((cuisine) {
                return _buildCuisineChip(cuisine);
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Trending
            const Text(
              'Trending Now',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildTrendingItem(
              'Healthy Havoc',
              'Salads, Healthy',
              '4.8',
              Icons.local_fire_department,
            ),
            _buildTrendingItem(
              'Asian Fusion',
              'Chinese, Asian',
              '4.6',
              Icons.trending_up,
            ),
            _buildTrendingItem(
              'Pizza Palace',
              'Italian, Pizza',
              '4.7',
              Icons.local_fire_department,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchItem(String text, IconData icon, {bool isRecent = false}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            if (isRecent)
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey, size: 20),
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCuisineChip(String cuisine) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Text(
          cuisine,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingItem(
    String name,
    String cuisine,
    String rating,
    IconData trendIcon,
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.restaurant,
                size: 30,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(
                        trendIcon,
                        color: _primaryPink,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cuisine,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
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
}
