import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v14 - Ocean Blue Theme
class AuthV14Screen extends StatefulWidget {
  const AuthV14Screen({super.key});

  @override
  State<AuthV14Screen> createState() => _AuthV14ScreenState();
}

class _AuthV14ScreenState extends State<AuthV14Screen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _deepBlue = Color(0xFF0A2463);
  static const Color _oceanBlue = Color(0xFF3E92CC);
  static const Color _lightBlue = Color(0xFF88CCF1);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFFB8D4E8);

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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_deepBlue, _oceanBlue],
            ),
          ),
          child: Stack(
            children: [
              // Wave decoration
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 200),
                  painter: _WavePainter(),
                ),
              ),

              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          _buildLogo(),
                          const SizedBox(height: 20),
                          _buildCard(),
                          const SizedBox(height: 20),
                          _buildSocials(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
            color: _white.withOpacity(0.15),
            shape: BoxShape.circle,
            border: Border.all(color: _white.withOpacity(0.3), width: 2),
          ),
          child: const Icon(Icons.sailing, size: 44, color: _white),
        ),
        const SizedBox(height: 24),
        Text(
          "RAWAAN",
          style: GoogleFonts.raleway(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: _white,
            letterSpacing: 6,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Dive into experience",
          style: GoogleFonts.raleway(fontSize: 14, color: _textSecondary),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: _white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: _white.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              _buildInput(
                controller: _phoneController,
                hint: "Phone Number",
                icon: Icons.phone_outlined,
                type: TextInputType.phone,
              ),
              const SizedBox(height: 18),
              _buildInput(
                controller: _passwordController,
                hint: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.raleway(color: _lightBlue, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildButton(),
            ],
          ),
        ),
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
        color: _white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _white.withOpacity(0.2)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword && !_isPasswordVisible,
        style: GoogleFonts.raleway(color: _white),
        cursorColor: _lightBlue,
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
          hintStyle: GoogleFonts.raleway(color: _textSecondary),
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
          color: _white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
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
                      color: _deepBlue, strokeWidth: 2),
                )
              : Text(
                  "Sign In",
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _deepBlue,
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
            Expanded(child: Divider(color: _white.withOpacity(0.3))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text("or", style: GoogleFonts.raleway(color: _textSecondary)),
            ),
            Expanded(child: Divider(color: _white.withOpacity(0.3))),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialBtn(FontAwesomeIcons.google),
            const SizedBox(width: 16),
            _socialBtn(FontAwesomeIcons.apple),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("New here? ",
                style: GoogleFonts.raleway(color: _textSecondary)),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Create Account",
                style: GoogleFonts.raleway(
                    color: _white, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialBtn(IconData icon) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: _white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _white.withOpacity(0.2)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: _white, size: 20),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.3,
          size.width * 0.5, size.height * 0.5)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.7, size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
