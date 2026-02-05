import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_discover_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_forgot_password_screen.dart';
import 'package:rawaan_vault/src/showcases/loza/loza_signup_screen.dart';

/// LOZA Login Screen
/// Features: Close button, email/password fields, Facebook login option
class LozoLoginScreen extends StatefulWidget {
  const LozoLoginScreen({super.key});

  @override
  State<LozoLoginScreen> createState() => _LozoLoginScreenState();
}

class _LozoLoginScreenState extends State<LozoLoginScreen> {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF9CA3AF);
  static const Color _borderGrey = Color(0xFFE5E7EB);
  static const Color _facebookBlue = Color(0xFF1877F2);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
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
                  'Login'.toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: _primaryBlack,
                  ),
                ),
                const SizedBox(height: 40),
                // Email Field
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                ),
                const SizedBox(height: 24),
                // Password Field
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                ),
                // const Spacer(),
                // Login Button
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
                      'LOGIN',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Forgot Password
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LozoForgotPasswordScreen()),
                      );
                    },
                    child: Text(
                      'Forgot your password?',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: _primaryBlack,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Facebook Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _facebookBlue,
                      side: const BorderSide(color: _facebookBlue, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    label: Text(
                      'LOGIN WITH GOOGLE',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: _facebookBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Sign Up Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
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
                                builder: (context) => const LozoSignupScreen()),
                          );
                        },
                        child: Text(
                          'Sign Up',
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
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: GoogleFonts.inter(fontSize: 16, color: _primaryBlack),
          decoration: InputDecoration(
            labelText: label,
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
      ],
    );
  }
}
