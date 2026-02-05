import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_discover_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_login_screen.dart';

/// LOZA Sign Up / Personal Details Screen
/// Features: Form fields for email, password, phone, DOB, address
class LozoSignupScreen extends StatefulWidget {
  const LozoSignupScreen({super.key});

  @override
  State<LozoSignupScreen> createState() => _LozoSignupScreenState();
}

class _LozoSignupScreenState extends State<LozoSignupScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF9CA3AF);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Close Button
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child:
                      const Icon(Icons.close, size: 24, color: _primaryBlack),
                ),
                const SizedBox(height: 32),
                // Title
                Text(
                  'Personal details'.toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: _primaryBlack,
                  ),
                ),
                const SizedBox(height: 40),
                // Email Field
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 24),
                // Password Field
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                // Phone Field
                _buildTextField(
                  controller: _phoneController,
                  label: 'Phone',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24),
                // Date of Birth Field
                _buildTextField(
                  controller: _dobController,
                  label: 'Date of birth',
                  icon: Icons.calendar_today_outlined,
                ),
                const SizedBox(height: 24),
                // Address Field
                _buildTextField(
                  controller: _addressController,
                  label: 'Address',
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 48),
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LozaDiscoverScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryBlack,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'SIGN UP',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Sign In Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: _textGrey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LozoLoginScreen()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _primaryBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: GoogleFonts.inter(fontSize: 16, color: _primaryBlack),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          color: _textGrey,
        ),
        prefixIcon: Icon(icon, color: _textGrey, size: 20),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: _borderGrey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: _primaryBlack),
        ),
      ),
    );
  }
}
