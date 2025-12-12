import 'package:flutter/material.dart';

class UberV2Screen extends StatefulWidget {
  const UberV2Screen({super.key});

  @override
  State<UberV2Screen> createState() => _UberV2ScreenState();
}

class _UberV2ScreenState extends State<UberV2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use stack to overlay UI elements on top of the Map
      body: Stack(
        children: [
          // 1. The Map Background (Layer 0)
          _buildMapBackground(),

          // 2. Top Floating UI (Menu & Profile) (Layer 1)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopSafeArea(),
          ),

          // 3. Draggable Bottom Sheet (Layer 2)
          _buildDraggableBottomSheet(),
        ],
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildMapBackground() {
    return Container(
      color: Colors.grey[200], // Placeholder for GoogleMap()
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Simulated Map Marker
          const Center(
            child: Icon(Icons.location_on, size: 50, color: Colors.black),
          ),
          // Simulated Route Line
          Positioned(
            bottom: 350,
            left: 50,
            child:
                Icon(Icons.location_history, size: 40, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSafeArea() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Menu Button
            _buildCircularButton(Icons.menu, () {}),

            // Profile / Points Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  SizedBox(width: 5),
                  Text("4.9", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggableBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.45, // Height when first opened
      minChildSize: 0.40, // Minimum height
      maxChildSize: 0.9, // Full screen height
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // "Where to?" Search Bar
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 30, color: Colors.black),
                    const SizedBox(width: 15),
                    Text(
                      "Where to?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.access_time_filled, size: 16),
                          SizedBox(width: 5),
                          Text("Now"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Previous Destinations
              _buildRecentLocation("Office", "123 Tech Blvd, Silicon Valley"),
              const Divider(height: 30),
              _buildRecentLocation("Gym", "Fit Street, Downtown"),

              const SizedBox(height: 30),

              // Services Grid Title
              const Text(
                "Suggestions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Services Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildServiceCard("Ride", "assets/car.png", Colors.grey[200]!,
                      Icons.local_taxi),
                  _buildServiceCard("Package", "assets/box.png",
                      Colors.grey[200]!, Icons.local_shipping),
                  _buildServiceCard("Reserve", "assets/cal.png",
                      Colors.grey[200]!, Icons.calendar_month),
                  _buildServiceCard("Rentals", "assets/key.png",
                      Colors.grey[200]!, Icons.key),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Helper Components ---

  Widget _buildCircularButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  Widget _buildRecentLocation(String title, String address) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.location_on, color: Colors.black54),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(address, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceCard(
      String label, String assetPath, Color bgColor, IconData fallbackIcon) {
    return Column(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          // Using Icon as fallback since I don't have your assets
          child: Icon(fallbackIcon, size: 30, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
