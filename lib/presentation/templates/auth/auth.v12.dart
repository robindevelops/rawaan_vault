import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v12 - Elegant Gold Theme
class AuthV12Screen extends StatefulWidget {
  const AuthV12Screen({super.key});

  @override
  State<AuthV12Screen> createState() => _AuthV12ScreenState();
}

class _AuthV12ScreenState extends State<AuthV12Screen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _background = Color(0xFF0D0D0D);
  static const Color _goldLight = Color(0xFFD4AF37);
  static const Color _goldDark = Color(0xFFAA8C2C);
  static const Color _cardColor = Color(0xFF1A1A1A);
  static const Color _textPrimary = Color(0xFFF5F5F5);
  static const Color _textSecondary = Color(0xFF888888);

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
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
                    const SizedBox(height: 30),
                    _buildInputs(),
                    const SizedBox(height: 20),
                    _buildButton(),
                    const SizedBox(height: 20),
                    _buildSocials(),
                    const SizedBox(height: 20),
                    _buildSignUp(),
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _goldLight,
              width: 2,
            ),
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [_goldLight, _goldDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(Icons.diamond, size: 44, color: Colors.white),
          ),
        ),
        const SizedBox(height: 28),
        Text(
          "RAWAAN",
          style: GoogleFonts.playfairDisplay(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: _goldLight,
            letterSpacing: 6,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Luxury Experience",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: _textSecondary,
            letterSpacing: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildInputs() {
    return Column(
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
              style: GoogleFonts.montserrat(color: _goldLight, fontSize: 13),
            ),
          ),
        ),
      ],
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
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _goldLight.withOpacity(0.2)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword && !_isPasswordVisible,
        style: GoogleFonts.montserrat(color: _textPrimary),
        cursorColor: _goldLight,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: _goldLight, size: 20),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: _goldLight.withOpacity(0.6),
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _isPasswordVisible = !_isPasswordVisible),
                )
              : null,
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(color: _textSecondary),
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
          gradient: const LinearGradient(
            colors: [_goldLight, _goldDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: _goldLight.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: _isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                      color: _background, strokeWidth: 2),
                )
              : Text(
                  "Sign In",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _background,
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
            Expanded(child: Divider(color: _goldLight.withOpacity(0.2))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("or",
                  style: GoogleFonts.montserrat(color: _textSecondary)),
            ),
            Expanded(child: Divider(color: _goldLight.withOpacity(0.2))),
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
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _goldLight.withOpacity(0.3)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: _goldLight, size: 20),
      ),
    );
  }

  Widget _buildSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New member? ",
          style: GoogleFonts.montserrat(color: _textSecondary, fontSize: 14),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Join Now",
            style: GoogleFonts.montserrat(
              color: _goldLight,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
