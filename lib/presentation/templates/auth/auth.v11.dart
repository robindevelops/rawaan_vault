import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v11 - Neon Cyberpunk Theme
class AuthV11Screen extends StatefulWidget {
  const AuthV11Screen({super.key});

  @override
  State<AuthV11Screen> createState() => _AuthV11ScreenState();
}

class _AuthV11ScreenState extends State<AuthV11Screen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _background = Color(0xFF0A0A0F);
  static const Color _neonCyan = Color(0xFF00F5FF);
  static const Color _neonPink = Color(0xFFFF00FF);
  static const Color _neonYellow = Color(0xFFFFFF00);
  static const Color _cardColor = Color(0xFF12121A);
  static const Color _textPrimary = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFF6B7280);

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
        body: Stack(
          children: [
            // Grid lines background
            CustomPaint(
              size: MediaQuery.of(context).size,
              painter: _GridPainter(),
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
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: _neonCyan, width: 2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: _neonCyan.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 2),
            ],
          ),
          child: Icon(Icons.bolt, size: 40, color: _neonCyan),
        ),
        const SizedBox(height: 24),
        Text(
          "RAWAAN",
          style: GoogleFonts.orbitron(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: _textPrimary,
            letterSpacing: 8,
            shadows: [
              Shadow(color: _neonCyan, blurRadius: 20),
              Shadow(color: _neonPink, blurRadius: 40),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "// SYSTEM ACCESS",
          style: GoogleFonts.firaCode(fontSize: 12, color: _neonCyan),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _neonCyan.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(color: _neonCyan.withOpacity(0.1), blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "> LOGIN_",
            style: GoogleFonts.firaCode(color: _neonCyan, fontSize: 14),
          ),
          const SizedBox(height: 24),
          _buildInput(
            controller: _phoneController,
            hint: "phone_number",
            icon: Icons.phone_android,
            type: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          _buildInput(
            controller: _passwordController,
            hint: "password",
            icon: Icons.vpn_key_outlined,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "> recover_access",
                style: GoogleFonts.firaCode(color: _neonPink, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildButton(),
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
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _neonCyan.withOpacity(0.3)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword && !_isPasswordVisible,
        style: GoogleFonts.firaCode(color: _textPrimary, fontSize: 14),
        cursorColor: _neonCyan,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: _neonCyan, size: 20),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: _neonCyan,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _isPasswordVisible = !_isPasswordVisible),
                )
              : null,
          hintText: hint,
          hintStyle: GoogleFonts.firaCode(color: _textSecondary, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
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
          color: _neonCyan,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: _neonCyan.withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 1),
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
                  "ENTER >",
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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
            Expanded(child: Divider(color: _neonCyan.withOpacity(0.2))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("// ALT",
                  style: GoogleFonts.firaCode(
                      color: _textSecondary, fontSize: 12)),
            ),
            Expanded(child: Divider(color: _neonCyan.withOpacity(0.2))),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialBtn(FontAwesomeIcons.google, _neonYellow),
            const SizedBox(width: 16),
            _socialBtn(FontAwesomeIcons.apple, _textPrimary),
            const SizedBox(width: 16),
            _socialBtn(FontAwesomeIcons.github, _neonPink),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("// no_account? ",
                style:
                    GoogleFonts.firaCode(color: _textSecondary, fontSize: 12)),
            GestureDetector(
              onTap: () {},
              child: Text(
                "register",
                style: GoogleFonts.firaCode(
                    color: _neonCyan,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialBtn(IconData icon, Color color) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.2), blurRadius: 10),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: color, size: 20),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00F5FF).withOpacity(0.05)
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
