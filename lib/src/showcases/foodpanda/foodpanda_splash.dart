import 'package:flutter/material.dart';
import 'foodpanda_home.dart';

class FoodpandaSplashScreen extends StatelessWidget {
  const FoodpandaSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD70F64),
              Color(0xFFE91E7B),
              Color(0xFFFF2B85),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Background decorative shapes
            Positioned(
              top: -80,
              right: -60,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.12),
                      Colors.white.withOpacity(0.03),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -120,
              left: -100,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.12),
                      Colors.white.withOpacity(0.03),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: -40,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.02),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 180,
              right: -50,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.02),
                    ],
                  ),
                ),
              ),
            ),

            // Decorative food icons
            Positioned(
              top: 120,
              right: 30,
              child: Transform.rotate(
                angle: 0.3,
                child: Icon(
                  Icons.restaurant,
                  size: 45,
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 25,
              child: Transform.rotate(
                angle: -0.2,
                child: Icon(
                  Icons.local_pizza_outlined,
                  size: 35,
                  color: Colors.white.withOpacity(0.12),
                ),
              ),
            ),
            Positioned(
              bottom: 250,
              left: 60,
              child: Transform.rotate(
                angle: -0.3,
                child: Icon(
                  Icons.fastfood_outlined,
                  size: 40,
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
            ),
            Positioned(
              bottom: 300,
              right: 50,
              child: Transform.rotate(
                angle: 0.4,
                child: Icon(
                  Icons.coffee_outlined,
                  size: 32,
                  color: Colors.white.withOpacity(0.12),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              right: 20,
              child: Transform.rotate(
                angle: -0.2,
                child: Icon(
                  Icons.ramen_dining_outlined,
                  size: 28,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: 15,
              child: Transform.rotate(
                angle: 0.5,
                child: Icon(
                  Icons.icecream_outlined,
                  size: 30,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Panda logo with glow effect
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 40,
                          spreadRadius: 5,
                          offset: const Offset(0, 15),
                        ),
                        BoxShadow(
                          color: const Color(0xFFD70F64).withOpacity(0.3),
                          blurRadius: 60,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFD70F64),
                              Color(0xFFFF2B85),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '🐼',
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Brand name
                  const Text(
                    'foodpanda',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -2,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tagline
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Order food you love',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 100),

                  // Start button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        // Main CTA button

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFFD70F64),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 10,
                            shadowColor: Colors.black.withOpacity(0.3),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FoodpandaHomeScreen(),
                              ),
                            );
                          },
                          child: const Text('Get Started'),
                        ),

                        const SizedBox(height: 20),

                        // Secondary text
                        Text(
                          'Discover 1000+ restaurants near you',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom feature chips
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFeatureChip(Icons.delivery_dining, 'Fast Delivery'),
                  const SizedBox(width: 12),
                  _buildFeatureChip(Icons.verified_outlined, 'Best Quality'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white.withOpacity(0.9)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
