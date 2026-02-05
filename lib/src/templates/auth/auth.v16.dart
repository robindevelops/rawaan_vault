import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// v16 - Monochrome Split Theme
class AuthV16Screen extends StatefulWidget {
  const AuthV16Screen({super.key});

  @override
  State<AuthV16Screen> createState() => _AuthV16ScreenState();
}

class _AuthV16ScreenState extends State<AuthV16Screen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _black = Color(0xFF000000);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _gray = Color(0xFF888888);

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Row(
          children: [
            // Left black side
            Expanded(
              child: Container(
                color: _black,
                child: SafeArea(
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "RAWAAN",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 80,
                          color: _white,
                          letterSpacing: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Right white side
            Expanded(
              flex: 2,
              child: Container(
                color: _white,
                child: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back"..toLowerCase(),
                              style: GoogleFonts.aBeeZee(
                                fontSize: 24,
                                color: _black,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Sign in to continue",
                              style:
                                  GoogleFonts.inter(fontSize: 14, color: _gray),
                            ),
                            const SizedBox(height: 40),
                            _buildInput(
                              controller: _phoneController,
                              label: "PHONE",
                              type: TextInputType.phone,
                            ),
                            const SizedBox(height: 24),
                            _buildInput(
                              controller: _passwordController,
                              label: "PASSWORD",
                              isPassword: true,
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                child: Text(
                                  "Forgot?",
                                  style: GoogleFonts.inter(
                                      color: _gray, fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            _buildButton(),
                            const SizedBox(height: 40),
                            _buildSocials(),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
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

  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    TextInputType type = TextInputType.text,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: _gray,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: _black, width: 2)),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: isPassword && !_isPasswordVisible,
            style: GoogleFonts.inter(color: _black, fontSize: 16),
            cursorColor: _black,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _gray,
                        size: 20,
                      ),
                      onPressed: () => setState(
                          () => _isPasswordVisible = !_isPasswordVisible),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: _isLoading ? null : () => setState(() => _isLoading = true),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: _black,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Center(
          child: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child:
                      CircularProgressIndicator(color: _white, strokeWidth: 2),
                )
              : Text(
                  "SIGN IN",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: _white,
                    letterSpacing: 4,
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
            const Expanded(child: Divider(color: _gray)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("OR",
                  style: GoogleFonts.inter(
                      color: _gray, fontSize: 11, letterSpacing: 2)),
            ),
            const Expanded(child: Divider(color: _gray)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialBtn(FontAwesomeIcons.google),
            const SizedBox(width: 20),
            _socialBtn(FontAwesomeIcons.apple),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No account? ",
                style: GoogleFonts.inter(color: _gray, fontSize: 13)),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Register",
                style: GoogleFonts.inter(
                    color: _black, fontSize: 13, fontWeight: FontWeight.w700),
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
        border: Border.all(color: _black, width: 2),
      ),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: _black, size: 20),
      ),
    );
  }
}
