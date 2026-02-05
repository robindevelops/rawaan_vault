import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v10 - Neumorphic Light Theme
class AuthV10Screen extends StatefulWidget {
  const AuthV10Screen({super.key});

  @override
  State<AuthV10Screen> createState() => _AuthV10ScreenState();
}

class _AuthV10ScreenState extends State<AuthV10Screen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _background = Color(0xFFE8EDF5);
  static const Color _darkShadow = Color(0xFFBEC8D9);
  static const Color _lightShadow = Color(0xFFFFFFFF);
  static const Color _accent = Color(0xFF6366F1);
  static const Color _textPrimary = Color(0xFF1F2937);
  static const Color _textSecondary = Color(0xFF6B7280);

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  BoxDecoration get _neumorphicDecor => BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: _darkShadow, offset: Offset(6, 6), blurRadius: 15),
          BoxShadow(
              color: _lightShadow, offset: Offset(-6, -6), blurRadius: 15),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildLogo(),
                    const SizedBox(height: 20),
                    _buildInputCard(),
                    const SizedBox(height: 20),
                    _buildButton(),
                    const SizedBox(height: 20),
                    _buildSocials(),
                    const SizedBox(height: 20),
                    _buildSignUp(),
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

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: _neumorphicDecor,
          child: Icon(Icons.lock_open_rounded, size: 40, color: _accent),
        ),
        const SizedBox(height: 28),
        Text(
          "RAWAAN",
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: _textPrimary,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Welcome back",
          style: GoogleFonts.poppins(fontSize: 14, color: _textSecondary),
        ),
      ],
    );
  }

  Widget _buildInputCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: _neumorphicDecor,
      child: Column(
        children: [
          _buildInput(
            controller: _phoneController,
            hint: "Phone Number",
            icon: Icons.phone_outlined,
            type: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          _buildInput(
            controller: _passwordController,
            hint: "Password",
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.poppins(color: _accent, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType type = TextInputType.text,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: _darkShadow.withOpacity(0.4),
            offset: const Offset(3, 3),
            blurRadius: 6,
          ),
          const BoxShadow(
            color: _lightShadow,
            offset: Offset(-3, -3),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword && !_isPasswordVisible,
        style: GoogleFonts.poppins(color: _textPrimary),
        cursorColor: _accent,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: _textSecondary, size: 20),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: _textSecondary,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _isPasswordVisible = !_isPasswordVisible),
                )
              : null,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: _textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(18),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: _isLoading ? null : () => setState(() => _isLoading = true),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_accent, _accent.withBlue(255)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _accent.withOpacity(0.4),
              offset: const Offset(0, 8),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2),
                )
              : Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSocials() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: _darkShadow)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text("or", style: GoogleFonts.poppins(color: _textSecondary)),
            ),
            const Expanded(child: Divider(color: _darkShadow)),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialBtn(FontAwesomeIcons.google),
            const SizedBox(width: 20),
            _socialBtn(FontAwesomeIcons.apple),
          ],
        ),
      ],
    );
  }

  Widget _socialBtn(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: _neumorphicDecor,
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: _textPrimary, size: 22),
      ),
    );
  }

  Widget _buildSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("New here? ", style: GoogleFonts.poppins(color: _textSecondary)),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Create account",
            style: GoogleFonts.poppins(
                color: _accent, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
