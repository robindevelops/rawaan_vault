import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// LOZA Forgot Password Screen
/// Features: Close button, email field, send button
class LozoForgotPasswordScreen extends StatefulWidget {
  const LozoForgotPasswordScreen({super.key});

  @override
  State<LozoForgotPasswordScreen> createState() =>
      _LozoForgotPasswordScreenState();
}

class _LozoForgotPasswordScreenState extends State<LozoForgotPasswordScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Close Button
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, size: 24, color: _primaryBlack),
              ),
              const SizedBox(height: 32),
              // Title
              Text(
                'Forgot Password'.toUpperCase(),
                style: GoogleFonts.cairo(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                'Please enter your email address. You will receive a link to create a new password via email.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: _textGrey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              // Email Field
              TextField(
                controller: _emailController,
                style: GoogleFonts.inter(fontSize: 16, color: _primaryBlack),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 14,
                    color: _textGrey,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: _borderGrey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: _primaryBlack),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Send Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryBlack,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'SEND',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
