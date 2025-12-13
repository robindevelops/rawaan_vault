import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// ════════════════════════════════════════════════════════════════════════════
/// AUTH V19 - Cloud White Theme
/// ════════════════════════════════════════════════════════════════════════════
/// Design Style: Ultra-minimal, centered layout with pure white background
/// Color Palette: White (#FFFFFF), Soft Gray (#F5F5F5), Charcoal (#2D2D2D)
/// Button Style: Filled, rounded corners
/// Font: Inter (clean, modern sans-serif)
/// Vibe: Premium, startup-ready, clean and airy
/// ════════════════════════════════════════════════════════════════════════════
class AuthV19Screen extends StatefulWidget {
  const AuthV19Screen({super.key});

  @override
  State<AuthV19Screen> createState() => _AuthV19ScreenState();
}

class _AuthV19ScreenState extends State<AuthV19Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Cloud White Theme Colors
  static const Color _background = Color(0xFFFFFFFF);
  static const Color _surfaceLight = Color(0xFFF8F9FA);
  static const Color _borderColor = Color(0xFFE8E8E8);
  static const Color _primaryColor = Color(0xFF1A1A1A);
  static const Color _textPrimary = Color(0xFF2D2D2D);
  static const Color _textSecondary = Color(0xFF6B7280);
  static const Color _textTertiary = Color(0xFF9CA3AF);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: _background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    _buildLogo(),
                    const SizedBox(height: 48),
                    _buildWelcomeText(),
                    const SizedBox(height: 40),
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 12),
                    _buildForgotPassword(),
                    const SizedBox(height: 32),
                    _buildLoginButton(),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 24),
                    _buildSocialButtons(),
                    const SizedBox(height: 32),
                    _buildSignUpLink(),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          'R',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Welcome back'.toUpperCase(),
          style: GoogleFonts.cairo(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to your account to continue',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: _textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Container(
      decoration: BoxDecoration(
        color: _surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.inter(
          fontSize: 15,
          color: _textPrimary,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'Email address',
          hintStyle: GoogleFonts.inter(
            fontSize: 15,
            color: _textTertiary,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.mail_outline_rounded,
            color: _textTertiary,
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: _surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        style: GoogleFonts.inter(
          fontSize: 15,
          color: _textPrimary,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: GoogleFonts.inter(
            fontSize: 15,
            color: _textTertiary,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: _textTertiary,
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: _textTertiary,
              size: 20,
            ),
            onPressed: () {
              setState(() => _isPasswordVisible = !_isPasswordVisible);
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Forgot password?',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: _textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _isLoading ? null : () => setState(() => _isLoading = true),
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Sign in',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: _borderColor, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or continue with',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: _textTertiary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: Divider(color: _borderColor, thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      children: [
        Expanded(
            child: _buildSocialButton(Icons.g_mobiledata_rounded, 'Google')),
        const SizedBox(width: 12),
        Expanded(child: _buildSocialButton(Icons.apple_rounded, 'Apple')),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _textPrimary, size: 22),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: _textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign up',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: _primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
