import 'package:flutter/material.dart';

/// Food Template V3 - Sushi Restaurant Menu
/// A premium Japanese restaurant interface with dark theme and red accents
class FoodV3Screen extends StatefulWidget {
  const FoodV3Screen({super.key});

  @override
  State<FoodV3Screen> createState() => _FoodV3ScreenState();
}

class _FoodV3ScreenState extends State<FoodV3Screen>
    with SingleTickerProviderStateMixin {
  final Color _primaryRed = const Color(0xFFE53935);
  int _selectedTab = 0;
  bool _showTitle = false;
  late ScrollController _scrollController;
  late AnimationController _animationController;

  final List<String> _tabs = ['Sushi', 'Sashimi', 'Rolls', 'Ramen', 'Drinks'];

  final List<Map<String, dynamic>> _menuItems = [
    {
      'name': 'Dragon Roll',
      'description':
          'Shrimp tempura, eel, avocado, cucumber with special sauce',
      'price': 18,
      'originalPrice': null,
      'rating': 4.9,
      'reviews': 312,
      'isBestseller': true,
      'quantity': 0,
    },
    {
      'name': 'Salmon Nigiri Set',
      'description': 'Fresh Norwegian salmon, 8 pieces with wasabi & ginger',
      'price': 24,
      'originalPrice': 28,
      'rating': 4.8,
      'reviews': 256,
      'isBestseller': true,
      'quantity': 1,
    },
    {
      'name': 'Spicy Tuna Roll',
      'description': 'Fresh tuna, spicy mayo, cucumber, sesame seeds',
      'price': 16,
      'originalPrice': null,
      'rating': 4.7,
      'reviews': 189,
      'isBestseller': false,
      'quantity': 0,
    },
    {
      'name': 'Tonkotsu Ramen',
      'description': 'Rich pork broth, chashu, soft egg, nori, green onions',
      'price': 19,
      'originalPrice': 22,
      'rating': 4.9,
      'reviews': 445,
      'isBestseller': true,
      'quantity': 2,
    },
    {
      'name': 'Rainbow Roll',
      'description': 'California roll topped with assorted sashimi',
      'price': 22,
      'originalPrice': null,
      'rating': 4.6,
      'reviews': 167,
      'isBestseller': false,
      'quantity': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _onScroll() {
    if (_scrollController.offset > 140 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (_scrollController.offset <= 140 && _showTitle) {
      setState(() => _showTitle = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  int get _cartItemCount {
    return _menuItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
  }

  double get _cartTotal {
    return _menuItems.fold(
      0.0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Enhanced App Bar with Image
            SliverAppBar(
              expandedHeight: 240,
              pinned: true,
              backgroundColor: const Color(0xFF1A1A2E),
              surfaceTintColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 22),
                  ),
                ),
              ),
              title: AnimatedOpacity(
                opacity: _showTitle ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: const Text(
                  'Sakura Sushi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite_border,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF2D2D44),
                            Color(0xFF1A1A2E),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.1,
                              child: CustomPaint(
                                painter: _WavePainter(),
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.set_meal,
                              size: 100,
                              color: _primaryRed.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 16,
                      child: Row(
                        children: [
                          _buildPromoBadge(
                              '15% OFF', _primaryRed, Colors.white),
                          const SizedBox(width: 8),
                          _buildPromoBadge(
                              'Free Miso Soup', Colors.white, Colors.black87),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFF1A1A2E).withOpacity(0.95),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Sakura Sushi',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _primaryRed,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 16, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text(
                                        '4.9',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Japanese • Sushi • Ramen • Premium',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF252542),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    _buildInfoChip(
                        Icons.access_time_filled, '30-45 min', _primaryRed),
                    const SizedBox(width: 12),
                    _buildInfoChip(
                        Icons.delivery_dining, '\$2.99', Colors.orange),
                    const SizedBox(width: 12),
                    _buildInfoChip(Icons.reviews, '500+ reviews', Colors.amber),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                Container(
                  color: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SizedBox(
                    height: 44,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _tabs.length,
                      itemBuilder: (context, index) {
                        final isSelected = _selectedTab == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedTab = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? _primaryRed
                                  : const Color(0xFF252542),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: isSelected
                                    ? _primaryRed
                                    : const Color(0xFF3A3A5C),
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: _primaryRed.withOpacity(0.4),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                _tabs[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white60,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                height: 52,
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 300 + (index * 100)),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: _buildMenuItem(_menuItems[index], index),
                    );
                  },
                  childCount: _menuItems.length,
                ),
              ),
            ),
          ],
        ),
        if (_cartItemCount > 0)
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_primaryRed, const Color(0xFFFF5252)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: _primaryRed.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '$_cartItemCount items',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'View Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${_cartTotal.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward,
                          color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ]),
    );
  }

  Widget _buildPromoBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item, int index) {
    final quantity = item['quantity'] as int;
    final isBestseller = item['isBestseller'] as bool;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF252542),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _primaryRed.withOpacity(0.2),
                            const Color(0xFF3A3A5C),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.set_meal,
                          size: 45, color: _primaryRed.withOpacity(0.7)),
                    ),
                    if (isBestseller)
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, size: 10, color: Colors.white),
                              SizedBox(width: 2),
                              Text('Best',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    if (item['originalPrice'] != null)
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                              color: _primaryRed,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            '-${(((item['originalPrice'] - item['price']) / item['originalPrice']) * 100).round()}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: -0.3,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['description'],
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.6),
                            height: 1.3),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '\$${item['price']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: _primaryRed),
                          ),
                          if (item['originalPrice'] != null) ...[
                            const SizedBox(width: 6),
                            Text(
                              '\$${item['originalPrice']}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white38,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 14, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text('${item['rating']}',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(' (${item['reviews']})',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white.withOpacity(0.5))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    if (quantity == 0)
                      GestureDetector(
                        onTap: () =>
                            setState(() => _menuItems[index]['quantity'] = 1),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _primaryRed,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: _primaryRed.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3))
                            ],
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 22),
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                            color: _primaryRed.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => setState(
                                  () => _menuItems[index]['quantity']++),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(Icons.add,
                                      color: _primaryRed, size: 20)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Text('$quantity',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: _primaryRed)),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                if (_menuItems[index]['quantity'] > 0)
                                  _menuItems[index]['quantity']--;
                              }),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(Icons.remove,
                                      color: _primaryRed, size: 20)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  _SliverTabBarDelegate(this.child, {this.height = 52});
  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;
  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) =>
      child != oldDelegate.child || height != oldDelegate.height;
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    for (double y = 0; y < size.height; y += 40) {
      final path = Path();
      path.moveTo(0, y);
      for (double x = 0; x < size.width; x += 20) {
        path.quadraticBezierTo(x + 10, y - 10, x + 20, y);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
