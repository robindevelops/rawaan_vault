import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v15 - Creative Geometric Theme
class AuthV15Screen extends StatefulWidget {
  const AuthV15Screen({super.key});

  @override
  State<AuthV15Screen> createState() => _AuthV15ScreenState();
}

class _AuthV15ScreenState extends State<AuthV15Screen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  late AnimationController _floatController;
  late AnimationController _rotateController;

  static const Color _coral = Color(0xFFFF6B6B);
  static const Color _peach = Color(0xFFFFE66D);
  static const Color _mint = Color(0xFF4ECDC4);
  static const Color _purple = Color(0xFF9B5DE5);
  static const Color _darkBg = Color(0xFF1A1A2E);
  static const Color _cardBg = Color(0xFF16213E);
  static const Color _textPrimary = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFFB0B0C0);

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _floatController.dispose();
    _rotateController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _darkBg,
        body: Stack(
          children: [
            // Animated rotating shapes
            _buildAnimatedShapes(),

            // Blur overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(color: Colors.transparent),
              ),
            ),

            // Main content
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildCreativeLogo(),
                        const SizedBox(height: 20),
                        _buildGlassCard(),
                        const SizedBox(height: 10),
                        _buildSocials(),
                        const SizedBox(height: 10),
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

  Widget _buildAnimatedShapes() {
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) {
        return Stack(
          children: [
            // Large rotating circle
            Positioned(
              top: -100,
              right: -100,
              child: Transform.rotate(
                angle: _rotateController.value * 2 * math.pi,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [_coral, _peach, _mint, _purple, _coral],
                    ),
                  ),
                ),
              ),
            ),

            // Floating triangles
            AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                return Positioned(
                  bottom: 100 + (_floatController.value * 30),
                  left: -50,
                  child: Transform.rotate(
                    angle: _rotateController.value * math.pi,
                    child: CustomPaint(
                      size: const Size(200, 200),
                      painter: _TrianglePainter(_mint.withOpacity(0.6)),
                    ),
                  ),
                );
              },
            ),

            // Small floating cube
            AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                return Positioned(
                  top: 200 - (_floatController.value * 20),
                  left: 50,
                  child: Transform.rotate(
                    angle: _rotateController.value * 2 * math.pi * 0.5,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [_coral, _peach],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Bottom right blob
            Positioned(
              bottom: -80,
              right: -40,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [_purple.withOpacity(0.8), Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCreativeLogo() {
    return Column(
      children: [
        // Stacked colorful squares
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _coral,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _mint,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 40,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _peach,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "R",
                      style: GoogleFonts.righteous(
                        fontSize: 28,
                        color: _darkBg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [_coral, _peach, _mint],
          ).createShader(bounds),
          child: Text(
            "RAWAAN",
            style: GoogleFonts.righteous(
              fontSize: 36,
              color: Colors.white,
              letterSpacing: 6,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Create • Inspire • Explore",
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: _textSecondary,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildGlassCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: _cardBg.withOpacity(0.7),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              _buildCreativeInput(
                controller: _phoneController,
                hint: "Phone Number",
                icon: Icons.phone_outlined,
                color: _coral,
                type: TextInputType.phone,
              ),
              const SizedBox(height: 18),
              _buildCreativeInput(
                controller: _passwordController,
                hint: "Password",
                icon: Icons.lock_outline,
                color: _mint,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(color: _peach, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildCreativeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreativeInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required Color color,
    TextInputType type = TextInputType.text,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              obscureText: isPassword && !_isPasswordVisible,
              style: GoogleFonts.poppins(color: _textPrimary),
              cursorColor: color,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _textSecondary,
                          size: 20,
                        ),
                        onPressed: () => setState(
                            () => _isPasswordVisible = !_isPasswordVisible),
                      )
                    : null,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(color: _textSecondary),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreativeButton() {
    return GestureDetector(
      onTap: _isLoading ? null : () => setState(() => _isLoading = true),
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [_coral, _peach, _mint],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _coral.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
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
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's Go",
                      style: GoogleFonts.righteous(
                        fontSize: 18,
                        color: _darkBg,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.rocket_launch_rounded, color: _darkBg, size: 22),
                  ],
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
            Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "OR",
                  style:
                      GoogleFonts.poppins(color: _textSecondary, fontSize: 12),
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialBtn(FontAwesomeIcons.google, _coral),
            const SizedBox(width: 16),
            _socialBtn(FontAwesomeIcons.apple, _textPrimary),
            const SizedBox(width: 16),
            _socialBtn(FontAwesomeIcons.twitter, _mint),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New here? ",
              style: GoogleFonts.poppins(color: _textSecondary),
            ),
            GestureDetector(
              onTap: () {},
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [_coral, _peach],
                ).createShader(bounds),
                child: Text(
                  "Join the party!",
                  style: GoogleFonts.righteous(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialBtn(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: color, size: 22),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
