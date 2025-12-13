import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V23 - Sage Green Theme
/// Card-based layout, outlined button, muted green tones
/// Palette: Mint White (#F6FAF7), Sage (#6B8E6B), Forest (#3D5A3D)
class AuthV23Screen extends StatefulWidget {
  const AuthV23Screen({super.key});
  @override
  State<AuthV23Screen> createState() => _AuthV23ScreenState();
}

class _AuthV23ScreenState extends State<AuthV23Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFF6FAF7);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _border = Color(0xFFDCE8DC);
  static const Color _primary = Color(0xFF4A7C4A);
  static const Color _text1 = Color(0xFF2D3B2D);
  static const Color _text2 = Color(0xFF6B8E6B);
  static const Color _text3 = Color(0xFFA3BDA3);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  _logo(),
                  const SizedBox(height: 32),
                  _card(),
                  const SizedBox(height: 24),
                  _signUp(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() => Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                color: _primary, borderRadius: BorderRadius.circular(14)),
            child: const Center(
                child: Text('R',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700))),
          ),
          const SizedBox(height: 16),
          Text('Rawaan',
              style: GoogleFonts.manrope(
                  fontSize: 22, fontWeight: FontWeight.w700, color: _text1)),
        ],
      );

  Widget _card() => Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _border)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back',
                style: GoogleFonts.manrope(
                    fontSize: 22, fontWeight: FontWeight.w600, color: _text1)),
            const SizedBox(height: 6),
            Text('Sign in to continue',
                style: GoogleFonts.manrope(fontSize: 14, color: _text2)),
            const SizedBox(height: 28),
            _input(
                _emailController, 'Email address', Icons.mail_outline, false),
            const SizedBox(height: 16),
            _input(_passwordController, 'Password', Icons.lock_outline, true),
            const SizedBox(height: 12),
            _forgot(),
            const SizedBox(height: 24),
            _loginBtn(),
            const SizedBox(height: 20),
            _divider(),
            const SizedBox(height: 20),
            _socialBtns(),
          ],
        ),
      );

  Widget _input(
          TextEditingController c, String hint, IconData icon, bool isPwd) =>
      Container(
        decoration: BoxDecoration(
            color: _bg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border)),
        child: TextFormField(
          controller: c,
          obscureText: isPwd && !_isPasswordVisible,
          style: GoogleFonts.manrope(fontSize: 14, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.manrope(fontSize: 14, color: _text3),
            prefixIcon: Icon(icon, color: _text3, size: 20),
            suffixIcon: isPwd
                ? IconButton(
                    icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _text3,
                        size: 20),
                    onPressed: () => setState(
                        () => _isPasswordVisible = !_isPasswordVisible),
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(14),
          ),
        ),
      );

  Widget _forgot() => Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: Text('Forgot password?',
                style: GoogleFonts.manrope(
                    fontSize: 13,
                    color: _primary,
                    fontWeight: FontWeight.w500))),
      );

  Widget _loginBtn() => SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton(
          onPressed:
              _isLoading ? null : () => setState(() => _isLoading = true),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: _primary, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: _isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: _primary, strokeWidth: 2))
              : Text('Sign In',
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _primary)),
        ),
      );

  Widget _divider() => Row(
        children: [
          Expanded(child: Divider(color: _border)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text('or',
                  style: GoogleFonts.manrope(fontSize: 12, color: _text3))),
          Expanded(child: Divider(color: _border)),
        ],
      );

  Widget _socialBtns() => Row(
        children: [
          Expanded(child: _socialBtn(Icons.g_mobiledata)),
          const SizedBox(width: 12),
          Expanded(child: _socialBtn(Icons.apple)),
          const SizedBox(width: 12),
          Expanded(child: _socialBtn(Icons.facebook)),
        ],
      );

  Widget _socialBtn(IconData icon) => Container(
        height: 44,
        decoration: BoxDecoration(
            color: _bg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border)),
        child: IconButton(
            onPressed: () {}, icon: Icon(icon, color: _text1, size: 22)),
      );

  Widget _signUp() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ",
              style: GoogleFonts.manrope(fontSize: 14, color: _text2)),
          GestureDetector(
              onTap: () {},
              child: Text('Create account',
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: _primary,
                      fontWeight: FontWeight.w600))),
        ],
      );
}
