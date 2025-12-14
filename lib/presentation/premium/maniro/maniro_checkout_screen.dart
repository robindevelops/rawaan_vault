import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_home_screen.dart';

/// Maniro Checkout Screen
/// Features: Shipping address, payment method, order review, place order
class ManiroCheckoutScreen extends StatefulWidget {
  final double total;

  const ManiroCheckoutScreen({super.key, required this.total});

  @override
  State<ManiroCheckoutScreen> createState() => _ManiroCheckoutScreenState();
}

class _ManiroCheckoutScreenState extends State<ManiroCheckoutScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);
  static const Color _borderGrey = Color(0xFFE5E7EB);
  static const Color _successGreen = Color(0xFF10B981);

  int _selectedPaymentIndex = 0;
  int _currentStep = 0;

  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
      name: 'Credit Card',
      icon: Icons.credit_card,
      subtitle: '•••• •••• •••• 4242',
    ),
    PaymentMethod(
      name: 'PayPal',
      icon: Icons.account_balance_wallet,
      subtitle: 'john.doe@email.com',
    ),
    PaymentMethod(
      name: 'Apple Pay',
      icon: Icons.apple,
      subtitle: 'Express checkout',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildProgressIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShippingSection(),
                  const SizedBox(height: 24),
                  _buildPaymentSection(),
                  const SizedBox(height: 24),
                  _buildOrderSummarySection(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_back, color: _primaryBlack),
        ),
      ),
      title: Text(
        'Checkout',
        style: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: _primaryBlack,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          _buildProgressStep(0, 'Shipping', Icons.local_shipping_outlined),
          _buildProgressLine(0),
          _buildProgressStep(1, 'Payment', Icons.payment),
          _buildProgressLine(1),
          _buildProgressStep(2, 'Review', Icons.check_circle_outline),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, IconData icon) {
    final isActive = _currentStep >= step;
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isActive ? _primaryBlack : _backgroundGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isActive ? Colors.white : _textGrey,
            size: 22,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? _primaryBlack : _textGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine(int step) {
    final isActive = _currentStep > step;
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 24, left: 8, right: 8),
        color: isActive ? _primaryBlack : _borderGrey,
      ),
    );
  }

  Widget _buildShippingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Address',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _primaryBlack,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Change',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _backgroundGrey,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _primaryBlack, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.home_outlined,
                    color: _primaryBlack, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '123 Fashion Street, Style City, SC 12345',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: _textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.check_circle, color: _successGreen, size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _primaryBlack,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(_paymentMethods.length, (index) {
          final method = _paymentMethods[index];
          final isSelected = _selectedPaymentIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedPaymentIndex = index),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? _backgroundGrey : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? _primaryBlack : _borderGrey,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : _backgroundGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(method.icon, color: _primaryBlack, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          method.name,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _primaryBlack,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          method.subtitle,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: _textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? _primaryBlack : _borderGrey,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: _primaryBlack,
                              ),
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildOrderSummarySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Subtotal',
              '\$${(widget.total - 15 - (widget.total * 0.08 / 1.08)).toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _buildSummaryRow('Shipping', '\$15.00'),
          const SizedBox(height: 8),
          _buildSummaryRow('Tax',
              '\$${((widget.total - 15) * 0.08 / 1.08).toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          Container(height: 1, color: _borderGrey),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _primaryBlack,
                ),
              ),
              Text(
                '\$${widget.total.toStringAsFixed(2)}',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: _primaryBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _textGrey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _primaryBlack,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              _showOrderConfirmation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryBlack,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Place Order • \$${widget.total.toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showOrderConfirmation() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _successGreen.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: _successGreen,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Order Placed!',
              style: GoogleFonts.playfairDisplay(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: _primaryBlack,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your order #12345 has been placed successfully.\nEstimated delivery: 3-5 business days',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: _textGrey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ManiroHomeScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryBlack,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Continue Shopping',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Track Order',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final IconData icon;
  final String subtitle;

  PaymentMethod({
    required this.name,
    required this.icon,
    required this.subtitle,
  });
}
