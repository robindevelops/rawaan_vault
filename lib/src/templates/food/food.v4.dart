import 'package:flutter/material.dart';

/// Food Template V4 - Italian Pizzeria Menu
/// A warm Italian restaurant interface with terracotta and olive accents
class FoodV4Screen extends StatefulWidget {
  const FoodV4Screen({super.key});

  @override
  State<FoodV4Screen> createState() => _FoodV4ScreenState();
}

class _FoodV4ScreenState extends State<FoodV4Screen>
    with SingleTickerProviderStateMixin {
  final Color _primaryOrange = const Color(0xFFE07B39);
  final Color _bgCream = const Color(0xFFFAF6F1);
  int _selectedTab = 0;
  bool _showTitle = false;
  late ScrollController _scrollController;
  late AnimationController _animationController;

  final List<String> _tabs = [
    'Pizza',
    'Pasta',
    'Risotto',
    'Antipasti',
    'Dolci'
  ];

  final List<Map<String, dynamic>> _menuItems = [
    {
      'name': 'Margherita Classica',
      'description': 'San Marzano tomatoes, fresh mozzarella, basil, olive oil',
      'price': 16,
      'originalPrice': null,
      'rating': 4.9,
      'reviews': 423,
      'isBestseller': true,
      'quantity': 0,
    },
    {
      'name': 'Quattro Formaggi',
      'description': 'Mozzarella, gorgonzola, parmesan, fontina cheese blend',
      'price': 22,
      'originalPrice': 26,
      'rating': 4.8,
      'reviews': 312,
      'isBestseller': true,
      'quantity': 1,
    },
    {
      'name': 'Spaghetti Carbonara',
      'description': 'Guanciale, egg yolk, pecorino romano, black pepper',
      'price': 19,
      'originalPrice': null,
      'rating': 4.7,
      'reviews': 256,
      'isBestseller': false,
      'quantity': 0,
    },
    {
      'name': 'Risotto ai Funghi',
      'description': 'Arborio rice, porcini mushrooms, parmesan, truffle oil',
      'price': 24,
      'originalPrice': 28,
      'rating': 4.9,
      'reviews': 189,
      'isBestseller': true,
      'quantity': 2,
    },
    {
      'name': 'Tiramisu',
      'description': 'Espresso-soaked ladyfingers, mascarpone, cocoa powder',
      'price': 12,
      'originalPrice': null,
      'rating': 4.8,
      'reviews': 345,
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
        vsync: this, duration: const Duration(milliseconds: 300));
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

  int get _cartItemCount =>
      _menuItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
  double get _cartTotal => _menuItems.fold(
      0.0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgCream,
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 240,
              pinned: true,
              backgroundColor: _bgCream,
              surfaceTintColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1), blurRadius: 8)
                      ],
                    ),
                    child: Icon(Icons.arrow_back,
                        color: Colors.brown[800], size: 22),
                  ),
                ),
              ),
              title: AnimatedOpacity(
                opacity: _showTitle ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Text('Trattoria Roma',
                    style: TextStyle(
                        color: Colors.brown[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8)
                        ]),
                    child:
                        Icon(Icons.search, color: Colors.brown[800], size: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8)
                        ]),
                    child: Icon(Icons.favorite_border,
                        color: Colors.brown[800], size: 20),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFB8860B),
                            Colors.brown.shade700
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Opacity(
                                  opacity: 0.08,
                                  child: CustomPaint(
                                      painter: _OliveBranchPainter()))),
                          Center(
                              child: Icon(Icons.local_pizza,
                                  size: 100,
                                  color: Colors.white.withOpacity(0.3))),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 16,
                      child: Row(
                        children: [
                          _buildPromoBadge(
                              '20% OFF', _primaryOrange, Colors.white),
                          const SizedBox(width: 8),
                          _buildPromoBadge(
                              'Free Bruschetta', Colors.white, Colors.brown),
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
                              Colors.brown.shade900.withOpacity(0.9)
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
                                    child: Text('Trattoria Roma',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: _primaryOrange,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 16, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text('4.8',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text('Italian • Pizza • Pasta • Fine Dining',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14)),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05), blurRadius: 10)
                    ]),
                child: Row(
                  children: [
                    _buildInfoChip(
                        Icons.access_time_filled, '25-40 min', _primaryOrange),
                    const SizedBox(width: 12),
                    _buildInfoChip(Icons.delivery_dining, 'Free', Colors.green),
                    const SizedBox(width: 12),
                    _buildInfoChip(Icons.reviews, '800+ reviews', Colors.amber),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Text('Menu',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800])),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                Container(
                  color: _bgCream,
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
                              color: isSelected ? _primaryOrange : Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                  color: isSelected
                                      ? _primaryOrange
                                      : Colors.brown.shade200),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                          color:
                                              _primaryOrange.withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3))
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: Text(_tabs[index],
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.brown[700],
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      fontSize: 14)),
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
                      builder: (context, value, child) => Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Opacity(opacity: value, child: child)),
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
                      colors: [_primaryOrange, const Color(0xFFD2691E)]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: _primaryOrange.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8))
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('$_cartItemCount items',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                    const Spacer(),
                    const Text('View Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Text('\$${_cartTotal.toStringAsFixed(0)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          shape: BoxShape.circle),
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
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(text,
          style: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoChip(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(text,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600, color: color)),
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)
          ]),
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
                              _primaryOrange.withOpacity(0.2),
                              Colors.brown.shade100
                            ]),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.local_pizza,
                          size: 45, color: _primaryOrange.withOpacity(0.7)),
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
                              borderRadius: BorderRadius.circular(4)),
                          child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, size: 10, color: Colors.white),
                                SizedBox(width: 2),
                                Text('Best',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold))
                              ]),
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
                              color: _primaryOrange,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                              '-${(((item['originalPrice'] - item['price']) / item['originalPrice']) * 100).round()}%',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.brown[800])),
                      const SizedBox(height: 4),
                      Text(item['description'],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.brown[400],
                              height: 1.3),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text('\$${item['price']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: _primaryOrange)),
                          if (item['originalPrice'] != null) ...[
                            const SizedBox(width: 6),
                            Text('\$${item['originalPrice']}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.brown[300],
                                    decoration: TextDecoration.lineThrough))
                          ],
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(children: [
                              const Icon(Icons.star,
                                  size: 14, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text('${item['rating']}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown[800])),
                              Text(' (${item['reviews']})',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.brown[400]))
                            ]),
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
                              color: _primaryOrange,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: _primaryOrange.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3))
                              ]),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 22),
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                            color: _primaryOrange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () => setState(
                                    () => _menuItems[index]['quantity']++),
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(Icons.add,
                                        color: _primaryOrange, size: 20))),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Text('$quantity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: _primaryOrange))),
                            GestureDetector(
                                onTap: () => setState(() {
                                      if (_menuItems[index]['quantity'] > 0)
                                        _menuItems[index]['quantity']--;
                                    }),
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(Icons.remove,
                                        color: _primaryOrange, size: 20))),
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

class _OliveBranchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    for (double y = 0; y < size.height; y += 60) {
      for (double x = 0; x < size.width; x += 80) {
        canvas.drawOval(
            Rect.fromCenter(center: Offset(x, y), width: 20, height: 10),
            paint);
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(x + 15, y - 8), width: 20, height: 10),
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
