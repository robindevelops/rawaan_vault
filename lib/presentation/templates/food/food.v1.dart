import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodV1Screen extends StatefulWidget {
  const FoodV1Screen({super.key});

  @override
  _FoodV1ScreenState createState() => _FoodV1ScreenState();
}

class _FoodV1ScreenState extends State<FoodV1Screen> {
  // --- Enhanced Palette ---
  final Color kDarkBlue = const Color(0xFF0C1C84);
  final Color kBackground = const Color(0xFFF5F7FA); // Slightly cooler gray
  final Color kCardBg = const Color(0xFFFFFFFF);
  final Color kAccent = const Color(0xFFE07A5F);
  final Color kTextPrimary = const Color(0xFF1D1F24);
  final Color kTextSecondary = const Color(0xFF9094A6);

  // --- Data Mockups ---
  final List<String> categories = [
    "All",
    "Classic",
    "Filled",
    "Vegan",
    "Premium"
  ];
  int selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> cookies = [
    {
      "name": "Choco Melt",
      "price": "\$4.50",
      "rating": "4.8",
      "image":
          "https://github.com/aroobacodes/flutter_crumble/blob/main/crumble_project/lib/images/choco.png?raw=true"
    },
    {
      "name": "Red Velvet",
      "price": "\$5.20",
      "rating": "4.9",
      "image":
          "https://github.com/aroobacodes/flutter_crumble/blob/main/crumble_project/lib/images/cookie2.png?raw=true"
    },
    {
      "name": "Oatmeal",
      "price": "\$3.99",
      "rating": "4.5",
      "image":
          "https://github.com/aroobacodes/flutter_crumble/blob/main/crumble_project/lib/images/doublebg.png?raw=true"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: kBackground,
        // Custom AppBar implementation
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: kBackground,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.grid_view_rounded, color: kDarkBlue),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            "Crumble.",
            style: GoogleFonts.fjallaOne(
              fontSize: 28,
              color: kDarkBlue,
              letterSpacing: 1.2,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                backgroundImage:
                    const NetworkImage("https://i.pravatar.cc/150?img=32"),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Search Bar
                _buildSearchBar(),

                const SizedBox(height: 25),

                // 2. Promo Banner
                _buildModernPromo(),

                const SizedBox(height: 25),

                // 3. Categories
                _buildCategories(),

                const SizedBox(height: 25),

                // 4. Header for List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Popular Cookies",
                        style: GoogleFonts.cabin(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kTextPrimary,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: kAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 5. Horizontal Cookie List
                SizedBox(
                  height: 320, // Taller to accommodate floating images
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 24, right: 10),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: cookies.length,
                    itemBuilder: (context, index) {
                      return _buildFloatingCookieCard(cookies[index]);
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),

        // Floating Navigation Bar (Optional nice touch)
        extendBody: true,
      ),
    );
  }

  // --- WIDGETS ---

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search your cravings...",
            hintStyle: GoogleFonts.poppins(color: kTextSecondary, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: kTextSecondary),
            suffixIcon: Icon(Icons.tune, color: kDarkBlue),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildModernPromo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 150,
      decoration: BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: kDarkBlue.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative Circle
          Positioned(
            right: -20,
            top: -20,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: kAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "30% OFF",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Sweet Tooth\nSpecial",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                // Using an Icon here as placeholder, normally an Asset Image
                Expanded(
                  child: Transform.rotate(
                    angle: -0.2,
                    child: Icon(Icons.cookie,
                        size: 80, color: Colors.white.withOpacity(0.8)),
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
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                  color: isSelected ? kDarkBlue : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: isSelected
                          ? Colors.transparent
                          : Colors.grey.shade200)),
              child: Center(
                child: Text(
                  categories[index],
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : kTextSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFloatingCookieCard(Map<String, dynamic> cookie) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
      child: Stack(
        clipBehavior: Clip.none, // Allow image to overflow
        children: [
          // 1. White Card Background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
            ),
          ),

          // 2. Cookie Image (Floating)
          Positioned(
            top: 0, // Pushes it up
            left: 25, // Center roughly
            right: 25,
            child: Hero(
              tag: cookie['name'],
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: kTextPrimary.withOpacity(0.2),
                      blurRadius: 25,
                      offset: const Offset(0, 15),
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(cookie['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // 3. Content
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cookie['name'],
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 22,
                    color: kTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      cookie['rating'],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "• 150 Kcal",
                      style: GoogleFonts.poppins(
                        color: kTextSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cookie['price'],
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kTextPrimary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kTextPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
