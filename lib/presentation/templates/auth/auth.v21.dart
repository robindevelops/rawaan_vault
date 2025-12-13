import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// ════════════════════════════════════════════════════════════════════════════
/// AUTH V21 - Warm Cream Theme
/// ════════════════════════════════════════════════════════════════════════════
/// Design Style: Top-aligned layout with warm cream/beige tones
/// Color Palette: Cream (#FDF8F3), Warm Brown (#8B7355), Soft Tan (#D4C4B0)
/// Button Style: Soft shadow, rounded
/// Font: DM Sans (friendly, modern)
/// Vibe: Warm, inviting, lifestyle brand feel
/// ════════════════════════════════════════════════════════════════════════════
class AuthV21Screen extends StatefulWidget {
  const AuthV21Screen({super.key});

  @override
  State<AuthV21Screen> createState() => _AuthV21ScreenState();
}

class _AuthV21ScreenState extends State<AuthV21Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Warm Cream Theme Colors
  static const Color _background = Color(0xFFFDF8F3);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _borderColor = Color(0xFFE8E0D8);
  static const Color _primaryColor = Color(0xFF8B7355);
  static const Color _accentColor = Color(0xFFB89B7A);
  static const Color _textPrimary = Color(0xFF3D3228);
  static const Color _textSecondary = Color(0xFF7A6E60);
  static const Color _textTertiary = Color(0xFFB5A898);

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  _buildLogo(),
                  const SizedBox(height: 28),
                  _buildWelcomeText(),
                  const SizedBox(height: 28),
                  _buildEmailField(),
                  const SizedBox(height: 18),
                  _buildPasswordField(),
                  const SizedBox(height: 14),
                  _buildForgotPassword(),
                  const SizedBox(height: 36),
                  _buildLoginButton(),
                  const SizedBox(height: 32),
                  _buildDivider(),
                  const SizedBox(height: 28),
                  _buildSocialButtons(),
                  const SizedBox(height: 48),
                  _buildSignUpLink(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'R',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'Rawaan',
          style: GoogleFonts.dmSans(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: _textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: GoogleFonts.fjallaOne(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: _textPrimary,
            height: 1.15,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Sign in to continue to your account',
          style: GoogleFonts.dmSans(
            fontSize: 15,
            color: _textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: _surfaceLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _borderColor, width: 1),
          ),
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.dmSans(
              fontSize: 15,
              color: _textPrimary,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: GoogleFonts.dmSans(
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
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: _surfaceLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _borderColor, width: 1),
          ),
          child: TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            style: GoogleFonts.dmSans(
              fontSize: 15,
              color: _textPrimary,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: GoogleFonts.dmSans(
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
        ),
      ],
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
          style: GoogleFonts.dmSans(
            fontSize: 13,
            color: _primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _primaryColor.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : () => setState(() => _isLoading = true),
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
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
                'Sign In',
                style: GoogleFonts.dmSans(
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
            style: GoogleFonts.dmSans(
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
        const SizedBox(width: 14),
        Expanded(child: _buildSocialButton(Icons.apple_rounded, 'Apple')),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: _surfaceLight,
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
              style: GoogleFonts.dmSans(
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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: GoogleFonts.dmSans(
              fontSize: 14,
              color: _textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Sign up',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: _primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
