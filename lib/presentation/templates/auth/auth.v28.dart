import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V28 - Arctic White Theme
/// Centered layout, minimal filled button, pure arctic white tones
/// Palette: Arctic (#FFFFFF), Frost (#F1F5F9), Midnight (#0F172A)
class AuthV28Screen extends StatefulWidget {
  const AuthV28Screen({super.key});
  @override
  State<AuthV28Screen> createState() => _AuthV28ScreenState();
}

class _AuthV28ScreenState extends State<AuthV28Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFFFFFFF);
  static const Color _surface = Color(0xFFF8FAFC);
  static const Color _border = Color(0xFFE2E8F0);
  static const Color _primary = Color(0xFF0F172A);
  static const Color _text1 = Color(0xFF0F172A);
  static const Color _text2 = Color(0xFF475569);
  static const Color _text3 = Color(0xFF94A3B8);

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
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _logo(),
                  const SizedBox(height: 20),
                  _header(),
                  const SizedBox(height: 20),
                  _input(
                      _emailController, 'Email', Icons.alternate_email, false),
                  const SizedBox(height: 14),
                  _input(_passwordController, 'Password', Icons.lock_outline,
                      true),
                  const SizedBox(height: 20),
                  _loginBtn(),
                  const SizedBox(height: 16),
                  _forgot(),
                  const SizedBox(height: 32),
                  _divider(),
                  const SizedBox(height: 28),
                  _socialBtns(),
                  const SizedBox(height: 44),
                  _signUp(),
                  const SizedBox(height: 48),
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
            width: 54,
            height: 54,
            decoration: BoxDecoration(
                color: _primary, borderRadius: BorderRadius.circular(12)),
            child: const Center(
                child: Text('R',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700))),
          ),
          const SizedBox(height: 16),
          Text('RAWAAN',
              style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _text1,
                  letterSpacing: 4)),
        ],
      );

  Widget _header() => Column(
        children: [
          Text('Welcome Back',
              style: GoogleFonts.raleway(
                  fontSize: 28, fontWeight: FontWeight.w600, color: _text1)),
          const SizedBox(height: 8),
          Text('Sign in to continue',
              style: GoogleFonts.raleway(fontSize: 14, color: _text2)),
        ],
      );

  Widget _input(
          TextEditingController c, String hint, IconData icon, bool isPwd) =>
      Container(
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _border)),
        child: TextFormField(
          controller: c,
          obscureText: isPwd && !_isPasswordVisible,
          style: GoogleFonts.raleway(fontSize: 15, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.raleway(fontSize: 15, color: _text3),
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
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      );

  Widget _loginBtn() => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed:
              _isLoading ? null : () => setState(() => _isLoading = true),
          style: ElevatedButton.styleFrom(
              backgroundColor: _primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: _isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : Text('Sign In',
                  style: GoogleFonts.raleway(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
        ),
      );

  Widget _forgot() => TextButton(
      onPressed: () {},
      child: Text('Forgot your password?',
          style: GoogleFonts.raleway(fontSize: 13, color: _text2)));

  Widget _divider() => Row(
        children: [
          Expanded(child: Divider(color: _border)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('or',
                  style: GoogleFonts.raleway(fontSize: 13, color: _text3))),
          Expanded(child: Divider(color: _border)),
        ],
      );

  Widget _socialBtns() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _socialBtn(Icons.g_mobiledata),
          const SizedBox(width: 16),
          _socialBtn(Icons.apple),
          const SizedBox(width: 16),
          _socialBtn(Icons.facebook),
        ],
      );

  Widget _socialBtn(IconData icon) => Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _border)),
        child: IconButton(
            onPressed: () {}, icon: Icon(icon, color: _text1, size: 22)),
      );

  Widget _signUp() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ",
              style: GoogleFonts.raleway(fontSize: 14, color: _text2)),
          GestureDetector(
              onTap: () {},
              child: Text('Sign up',
                  style: GoogleFonts.raleway(
                      fontSize: 14,
                      color: _primary,
                      fontWeight: FontWeight.w600))),
        ],
      );
}
