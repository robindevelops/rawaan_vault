import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cart v6 - Compact Card Layout
/// Professional design with smaller compact item cards
class CartV6Screen extends StatefulWidget {
  const CartV6Screen({super.key});

  @override
  State<CartV6Screen> createState() => _CartV6ScreenState();
}

class _CartV6ScreenState extends State<CartV6Screen> {
  static const Color _bg = Color(0xFFF2F4F7);
  static const Color _card = Color(0xFFFFFFFF);
  static const Color _primary = Color(0xFF1F2937);
  static const Color _accent = Color(0xFF6366F1);
  static const Color _textPrimary = Color(0xFF1F2937);
  static const Color _textSecondary = Color(0xFF9CA3AF);

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Running Shoes Pro',
      'brand': 'SportMax',
      'price': 159.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=50',
      'size': 'US 10'
    },
    {
      'name': 'Training Shorts',
      'brand': 'ActiveWear',
      'price': 49.00,
      'qty': 2,
      'image': 'https://i.pravatar.cc/150?img=51',
      'size': 'Medium'
    },
    {
      'name': 'Compression Tee',
      'brand': 'FitGear',
      'price': 39.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=52',
      'size': 'Large'
    },
    {
      'name': 'Sport Water Bottle',
      'brand': 'HydroFit',
      'price': 29.00,
      'qty': 1,
      'image': 'https://i.pravatar.cc/150?img=53',
      'size': '750ml'
    },
  ];

  double get _subtotal =>
      _cartItems.fold(0, (s, i) => s + (i['price'] * i['qty']));
  double get _total => _subtotal + 12.99;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppBar(
          backgroundColor: _card,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: _bg, borderRadius: BorderRadius.circular(10)),
            child:
                const Icon(Icons.arrow_back_ios_new, size: 18, color: _primary),
          ),
          title: Text('Shopping Cart',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary)),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: _accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text('${_cartItems.length}',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _accent))),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Items',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _textSecondary)),
                      const SizedBox(height: 12),
                      ..._cartItems
                          .asMap()
                          .entries
                          .map((e) => _buildCompactItem(e.value, e.key)),
                      const SizedBox(height: 24),
                      _buildSummarySection(),
                    ]),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactItem(Map<String, dynamic> item, int idx) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ]),
      child: Row(
        children: [
          Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: _bg,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(item['image']), fit: BoxFit.cover))),
          const SizedBox(width: 14),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(item['name'],
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _textPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  GestureDetector(
                      onTap: () => setState(() => _cartItems.removeAt(idx)),
                      child:
                          Icon(Icons.close, size: 18, color: _textSecondary)),
                ],
              ),
              const SizedBox(height: 4),
              Text('${item['brand']} • ${item['size']}',
                  style:
                      GoogleFonts.inter(fontSize: 12, color: _textSecondary)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${item['price'].toStringAsFixed(2)}',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: _primary)),
                  Container(
                    decoration: BoxDecoration(
                        color: _bg, borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            if (item['qty'] > 1)
                              setState(() => _cartItems[idx]['qty']--);
                          },
                          child: Container(
                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              child: Icon(Icons.remove,
                                  size: 14, color: _textSecondary))),
                      Container(
                          width: 28,
                          alignment: Alignment.center,
                          child: Text('${item['qty']}',
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: _textPrimary))),
                      GestureDetector(
                          onTap: () => setState(() => _cartItems[idx]['qty']++),
                          child: Container(
                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              child:
                                  Icon(Icons.add, size: 14, color: _accent))),
                    ]),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ]),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Subtotal',
              style: GoogleFonts.inter(fontSize: 14, color: _textSecondary)),
          Text('\$${_subtotal.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _textPrimary)),
        ]),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Delivery',
              style: GoogleFonts.inter(fontSize: 14, color: _textSecondary)),
          Text('\$12.99',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _textPrimary)),
        ]),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Color(0xFFE5E7EB))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary)),
          Text('\$${_total.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                  fontSize: 20, fontWeight: FontWeight.w800, color: _primary)),
        ]),
      ]),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: _card, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4))
      ]),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
              color: _accent, borderRadius: BorderRadius.circular(14)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Center(
                    child: Text('Checkout • \$${_total.toStringAsFixed(2)}',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)))),
          ),
        ),
      ),
    );
  }
}
