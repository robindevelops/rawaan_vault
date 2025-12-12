import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthV8Screen extends StatefulWidget {
  const AuthV8Screen({super.key});

  @override
  State<AuthV8Screen> createState() => _AuthV8ScreenState();
}

class _AuthV8ScreenState extends State<AuthV8Screen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Minimal Theme Colors
  static const Color _background = Color(0xFF0D0D0D);
  static const Color _cardColor = Color(0xFF1A1A1A);
  static const Color _accentColor = Color(0xFFFFFFFF);
  static const Color _textPrimary = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFF6B6B6B);
  static const Color _inputBorder = Color(0xFF2A2A2A);

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: _background,
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),

                      // Minimal Logo
                      _buildLogo(),

                      const SizedBox(height: 80),

                      // Input Fields
                      _buildInputField(
                        controller: _phoneController,
                        hint: "Enter your phone number",
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 16),

                      _buildInputField(
                        controller: _passwordController,
                        hint: "Password",
                        isPassword: true,
                      ),

                      const SizedBox(height: 12),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            "Forgot?",
                            style: TextStyle(
                              color: _textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Sign In Button
                      _buildSignInButton(),

                      const SizedBox(height: 60),

                      // Divider
                      _buildDivider(),

                      const SizedBox(height: 32),

                      // Social Login
                      _buildSocialButtons(),

                      const SizedBox(height: 60),

                      // Sign Up
                      _buildSignUpLink(),

                      const SizedBox(height: 40),
                    ],
                  ),
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
        Text(
          "RAWAAN",
          style: GoogleFonts.cairo(
            color: _textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            // letterSpacing: 8,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Welcome back",
          style: GoogleFonts.cairo(
            color: _textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _inputBorder,
          width: 1,
        ),
      ),
      child: TextFormField(
        cursorColor: _accentColor,
        controller: controller,
        obscureText: isPassword && !_isPasswordVisible,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: _textPrimary,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: _textSecondary,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
          hintText: hint,
          hintStyle: const TextStyle(
            color: _textSecondary,
            fontSize: 15,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleSignIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: _accentColor,
          foregroundColor: _background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: _isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: _background,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: _inputBorder)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "or",
            style: TextStyle(
              color: _textSecondary,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(child: Divider(color: _inputBorder)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(FontAwesomeIcons.google),
        const SizedBox(width: 20),
        _buildSocialButton(FontAwesomeIcons.apple),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _inputBorder,
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: _textPrimary,
          size: 26,
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "New here? ",
          style: TextStyle(
            color: _textSecondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Create account",
            style: TextStyle(
              color: _textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Success"),
              backgroundColor: Colors.black,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      });
    }
  }
}
