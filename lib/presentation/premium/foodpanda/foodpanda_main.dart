import 'package:flutter/material.dart';
import 'foodpanda_home.dart';
import 'foodpanda_search.dart';
import 'foodpanda_orders.dart';
import 'foodpanda_account.dart';

class FoodpandaMainScreen extends StatefulWidget {
  const FoodpandaMainScreen({super.key});

  @override
  State<FoodpandaMainScreen> createState() => _FoodpandaMainScreenState();
}

class _FoodpandaMainScreenState extends State<FoodpandaMainScreen> {
  final Color _primaryPink = const Color(0xFFD70F64);
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FoodpandaHomeContent(),
    const FoodpandaSearchScreen(),
    const FoodpandaOrdersScreen(),
    const FoodpandaAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
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
