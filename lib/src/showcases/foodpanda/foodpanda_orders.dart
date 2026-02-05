import 'package:flutter/material.dart';

class FoodpandaOrdersScreen extends StatelessWidget {
  const FoodpandaOrdersScreen({super.key});

  final Color _primaryPink = const Color(0xFFD70F64);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Active Orders Section
          const Text(
            'Active Orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildOrderCard(
            restaurantName: 'Healthy Havoc',
            status: 'Preparing',
            statusColor: Colors.orange,
            items: '3 items',
            total: '\$33.07',
            time: 'Est. delivery: 25-35 min',
            isActive: true,
          ),
          const SizedBox(height: 24),

          // Past Orders Section
          const Text(
            'Past Orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildOrderCard(
            restaurantName: 'Pizza Palace',
            status: 'Delivered',
            statusColor: Colors.green,
            items: '2 items',
            total: '\$24.99',
            time: 'Jan 18, 2026',
            isActive: false,
          ),
          const SizedBox(height: 12),
          _buildOrderCard(
            restaurantName: 'Asian Fusion',
            status: 'Delivered',
            statusColor: Colors.green,
            items: '4 items',
            total: '\$45.50',
            time: 'Jan 15, 2026',
            isActive: false,
          ),
          const SizedBox(height: 12),
          _buildOrderCard(
            restaurantName: 'Burger Barn',
            status: 'Cancelled',
            statusColor: Colors.red,
            items: '1 item',
            total: '\$12.99',
            time: 'Jan 12, 2026',
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String restaurantName,
    required String status,
    required Color statusColor,
    required String items,
    required String total,
    required String time,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isActive
            ? Border.all(color: _primaryPink.withOpacity(0.3), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.restaurant,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurantName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$items • $total',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isActive ? Icons.access_time : Icons.calendar_today,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              if (isActive)
                Text(
                  'Track order',
                  style: TextStyle(
                    color: _primaryPink,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                )
              else
                Text(
                  'Reorder',
                  style: TextStyle(
                    color: _primaryPink,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
