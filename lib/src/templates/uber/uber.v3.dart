import 'package:flutter/material.dart';

class UberV3Screen extends StatefulWidget {
  const UberV3Screen({super.key});

  @override
  State<UberV3Screen> createState() => _UberV3ScreenState();
}

class _UberV3ScreenState extends State<UberV3Screen> {
  // Track selected ride index
  int _selectedRideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Map Layer with Route
          _buildMapWithRoute(),

          // 2. Top Floating Back Button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopBar(context),
          ),

          // 3. Bottom Vehicle Selection Panel
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildRideSelectionPanel(),
          ),
        ],
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildMapWithRoute() {
    return Container(
      color: Colors.grey[200], // Map Placeholder
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Simulated Route Line (Custom Paint or Container)
          Positioned(
            top: 200,
            left: 100,
            child: Container(
              width: 5,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Pickup Marker
          const Positioned(
            top: 180,
            left: 88,
            child: Icon(Icons.my_location, color: Colors.black, size: 30),
          ),
          // Drop-off Marker
          const Positioned(
            top: 380,
            left: 88,
            child: Icon(Icons.location_on, color: Colors.red, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Back Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  )
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Handle back navigation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRideSelectionPanel() {
    return Container(
      height: 400, // Fixed height for selection area
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag Handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 10),
          const Text(
            "Choose a ride",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const Divider(),

          // Ride List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              children: [
                _buildRideOption(
                    0, "UberX", "3 min", "\$12.50", Icons.local_taxi, false),
                _buildRideOption(
                    1, "Comfort", "5 min", "\$15.80", Icons.event_seat, false),
                _buildRideOption(2, "UberXL", "7 min", "\$22.10",
                    Icons.airport_shuttle, true),
                _buildRideOption(
                    3, "Black", "4 min", "\$30.00", Icons.stars, true),
              ],
            ),
          ),

          // Bottom Confirmation Section
          _buildPaymentAndConfirm(),
        ],
      ),
    );
  }

  Widget _buildRideOption(int index, String title, String time, String price,
      IconData icon, bool isPremium) {
    bool isSelected = _selectedRideIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRideIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[100] : Colors.transparent,
          border: isSelected
              ? Border.all(color: Colors.black, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Car Icon Placeholder
            Image.asset(
              "assets/car_placeholder.png", // Replace with your asset
              width: 60,
              height: 40,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(icon, size: 40, color: Colors.black87),
            ),
            const SizedBox(width: 15),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.person, size: 14, color: Colors.grey),
                      Text(
                        isPremium ? "4" : "3",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Price
            Text(
              price,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentAndConfirm() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, -5),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          // Payment Row
          Row(
            children: [
              const Icon(Icons.payment, color: Colors.green),
              const SizedBox(width: 10),
              const Text("Personal • Visa **** 4242",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 15),

          // Confirm Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Confirm UberX",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
