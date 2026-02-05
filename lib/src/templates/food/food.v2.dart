import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodV2Screen extends StatefulWidget {
  const FoodV2Screen({super.key});

  @override
  State<FoodV2Screen> createState() => _FoodV2ScreenState();
}

class _FoodV2ScreenState extends State<FoodV2Screen> {
  static const Color _yellow = Color(0xFFFFC107);
  static const Color _bg = Color(0xFFFAFAFA);
  static const Color _dark = Color(0xFF1A1A1A);
  static const Color _grey = Color(0xFF9E9E9E);

  int _selectedCategory = 0;

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.local_fire_department_rounded, 'label': 'Popular'},
    {'icon': Icons.local_pizza_outlined, 'label': 'Western'},
    {'icon': Icons.coffee_outlined, 'label': 'Drinks'},
    {'icon': Icons.restaurant_outlined, 'label': 'Local'},
    {'icon': Icons.icecream_outlined, 'label': 'Dessert'},
  ];

  final List<Map<String, dynamic>> _recipes = [
    {
      'name': 'Chicken Curry',
      'category': 'Asian',
      'time': '15 mins',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400'
    },
    {
      'name': 'Crepes with Orange..',
      'category': 'Western',
      'time': '35 mins',
      'rating': '4.5',
      'image':
          'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400'
    },
    {
      'name': 'Pasta Carbonara',
      'category': 'Italian',
      'time': '25 mins',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400'
    },
    {
      'name': 'Smoothie Bowl',
      'category': 'Healthy',
      'time': '10 mins',
      'rating': '4.9',
      'image':
          'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=400'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          // Decorative Yellow Blobs
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _yellow.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _yellow.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://i.pravatar.cc/150?img=47'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: Icon(Icons.notifications_outlined,
                              color: _dark, size: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Greeting
                    Text('Hello, Teresa!',
                        style: GoogleFonts.poppins(fontSize: 14, color: _grey)),
                    const SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: _dark,
                            height: 1.3),
                        children: [
                          const TextSpan(text: 'Make your own food,\nstay at '),
                          TextSpan(
                              text: 'home', style: TextStyle(color: _yellow)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: _grey),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search any recipe',
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14, color: _grey),
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: _bg,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.tune, color: _dark, size: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    // Categories
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (_, i) {
                          final selected = _selectedCategory == i;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedCategory = i),
                            child: Container(
                              width: 75,
                              margin: const EdgeInsets.only(right: 12),
                              child: Column(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: selected ? _yellow : Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: selected
                                          ? [
                                              BoxShadow(
                                                color: _yellow.withOpacity(0.4),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4),
                                              )
                                            ]
                                          : null,
                                    ),
                                    child: Icon(
                                      _categories[i]['icon'],
                                      color: selected ? Colors.white : _dark,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(_categories[i]['label'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: selected ? _dark : _grey,
                                          fontWeight: selected
                                              ? FontWeight.w500
                                              : FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Section Title
                    Text('Popular Recipes',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: _dark)),
                    const SizedBox(height: 16),
                    // Recipe Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: _recipes.length,
                      itemBuilder: (_, i) => _buildRecipeCard(_recipes[i]),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Nav
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: _yellow,
        unselectedItemColor: _grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(Map<String, dynamic> recipe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(recipe['image']),
                        fit: BoxFit.cover),
                  ),
                ),
                // Time Badge
                Positioned(
                  top: 18,
                  left: 18,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time, size: 12, color: _grey),
                        const SizedBox(width: 4),
                        Text(recipe['time'],
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: _dark)),
                      ],
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  bottom: 18,
                  right: 18,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: _yellow, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, size: 12, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(recipe['rating'],
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe['name'],
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _dark),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(recipe['category'],
                    style: GoogleFonts.poppins(fontSize: 12, color: _grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 5))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home Button (Active)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: _bg, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(Icons.grid_view_rounded, color: _dark, size: 20),
                const SizedBox(width: 8),
                Text('Home',
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _dark)),
              ],
            ),
          ),
          // Add Button
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: _bg, shape: BoxShape.circle),
            child: Icon(Icons.add, color: _dark, size: 24),
          ),
          // Bookmark
          Icon(Icons.bookmark_outline, color: _grey, size: 24),
        ],
      ),
    );
  }
}
