import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// ════════════════════════════════════════════════════════════════════════════
/// AUTH V20 - Soft Stone Theme
/// ════════════════════════════════════════════════════════════════════════════
/// Design Style: Card-based layout with soft stone gray tones
/// Color Palette: Off-White (#FAFAFA), Stone (#78716C), Warm Gray (#A8A29E)
/// Button Style: Outlined with subtle hover
/// Font: Plus Jakarta Sans (geometric, modern)
/// Vibe: Professional, elegant, corporate-friendly
/// ════════════════════════════════════════════════════════════════════════════
class AuthV20Screen extends StatefulWidget {
  const AuthV20Screen({super.key});

  @override
  State<AuthV20Screen> createState() => _AuthV20ScreenState();
}

class _AuthV20ScreenState extends State<AuthV20Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Soft Stone Theme Colors
  static const Color _background = Color(0xFFFAFAFA);
  static const Color _cardBackground = Color(0xFFFFFFFF);
  static const Color _borderColor = Color(0xFFE7E5E4);
  static const Color _primaryColor = Color(0xFF57534E);
  static const Color _accentColor = Color(0xFF78716C);
  static const Color _textPrimary = Color(0xFF292524);
  static const Color _textSecondary = Color(0xFF78716C);
  static const Color _textTertiary = Color(0xFFA8A29E);

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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 20),

                    const SizedBox(height: 24),
                    _buildCard(),
                    const SizedBox(height: 20),
                    _buildFooter(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          'Rawaan'.toUpperCase(),
          style: GoogleFonts.cairo(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: _textPrimary,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: _cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: _textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Enter your credentials to access your account',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              color: _textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 28),
          _buildInputLabel('Email'),
          const SizedBox(height: 8),
          _buildEmailField(),
          const SizedBox(height: 20),
          _buildInputLabel('Password'),
          const SizedBox(height: 8),
          _buildPasswordField(),
          const SizedBox(height: 16),
          _buildForgotPassword(),
          const SizedBox(height: 28),
          _buildLoginButton(),
          const SizedBox(height: 20),
          _buildDivider(),
          const SizedBox(height: 20),
          _buildSocialButtons(),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: _textSecondary,
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: _textPrimary,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'name@example.com',
          hintStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: _textTertiary,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: _textPrimary,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'Enter your password',
          hintStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: _textTertiary,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: _textTertiary,
              size: 18,
            ),
            onPressed: () {
              setState(() => _isPasswordVisible = !_isPasswordVisible);
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
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
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            color: _accentColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: _isLoading ? null : () => setState(() => _isLoading = true),
        style: OutlinedButton.styleFrom(
          backgroundColor: _primaryColor,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Sign in',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'or',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
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
        Expanded(child: _buildSocialButton(Icons.g_mobiledata_rounded)),
        const SizedBox(width: 12),
        Expanded(child: _buildSocialButton(Icons.apple_rounded)),
        const SizedBox(width: 12),
        Expanded(child: _buildSocialButton(Icons.facebook_outlined)),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: _textPrimary, size: 22),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: _textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Create account',
            style: GoogleFonts.plusJakartaSans(
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
