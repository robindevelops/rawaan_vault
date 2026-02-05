import 'package:flutter/material.dart';

class FoodpandaCartScreen extends StatefulWidget {
  const FoodpandaCartScreen({super.key});

  @override
  State<FoodpandaCartScreen> createState() => _FoodpandaCartScreenState();
}

class _FoodpandaCartScreenState extends State<FoodpandaCartScreen> {
  final Color _primaryPink = const Color(0xFFD70F64);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Moroccan Salad',
      'quantity': 1,
      'price': 12.99,
    },
    {
      'name': 'Salmon Salad',
      'quantity': 1,
      'price': 12.09,
    },
    {
      'name': 'Veggie Vegan Bowl',
      'quantity': 1,
      'price': 7.99,
    },
  ];

  double get subtotal {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Delivery Address
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.location_on, color: _primaryPink, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Hobskin Road, CA',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
          const Divider(height: 1),

          // Restaurant Info
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 8),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Healthy Havoc',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Delivery Charge',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _primaryPink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'FREE',
                        style: TextStyle(
                          color: _primaryPink,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Cart Items
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _cartItems.length,
                separatorBuilder: (context, index) => const Divider(height: 24),
                itemBuilder: (context, index) {
                  return _buildCartItem(_cartItems[index]);
                },
              ),
            ),
          ),

          // Voucher Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(Icons.confirmation_number_outlined, color: _primaryPink),
                const SizedBox(width: 12),
                const Text(
                  'Apply Voucher',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(Icons.chevron_right, color: _primaryPink),
              ],
            ),
          ),

          // Payment Summary
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                _buildSummaryRow(
                    'Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
                const SizedBox(height: 12),
                _buildSummaryRow('Delivery Charge', 'FREE', isHighlight: true),
                const Divider(height: 24),
                _buildSummaryRow(
                  'Total Amount',
                  '\$${subtotal.toStringAsFixed(2)}',
                  isTotal: true,
                ),
              ],
            ),
          ),

          // Checkout Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryPink,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Review payment and address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Row(
      children: [
        // Image
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.restaurant,
            size: 35,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(width: 12),
        // Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${item['price'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: _primaryPink,
                ),
              ),
            ],
          ),
        ),
        // Quantity controls
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildQuantityButton(
                Icons.remove,
                () {
                  // Decrease quantity
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${item['quantity']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              _buildQuantityButton(
                Icons.add,
                () {
                  // Increase quantity
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    bool isHighlight = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: isHighlight
                ? _primaryPink
                : isTotal
                    ? Colors.black
                    : Colors.black87,
          ),
        ),
      ],
    );
  }
}
