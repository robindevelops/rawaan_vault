import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V27 - Sand Dune Theme
/// Top-aligned layout, outlined button, warm sand tones
/// Palette: Sand (#FBF9F4), Dune (#A39278), Desert (#6B5B4F)
class AuthV27Screen extends StatefulWidget {
  const AuthV27Screen({super.key});
  @override
  State<AuthV27Screen> createState() => _AuthV27ScreenState();
}

class _AuthV27ScreenState extends State<AuthV27Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFFBF9F4);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _border = Color(0xFFE6E0D5);
  static const Color _primary = Color(0xFF6B5B4F);
  static const Color _text1 = Color(0xFF3D352C);
  static const Color _text2 = Color(0xFF8C7C6D);
  static const Color _text3 = Color(0xFFB5A898);

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _logoRow(),
                const SizedBox(height: 20),
                _header(),
                const SizedBox(height: 20),
                _label('Email'),
                const SizedBox(height: 8),
                _input(
                  _emailController,
                  'you@example.com',
                  Icons.mail_outline,
                  false,
                ),
                const SizedBox(height: 20),
                _label('Password'),
                const SizedBox(height: 8),
                _input(_passwordController, 'Enter password',
                    Icons.lock_outline, true),
                const SizedBox(height: 14),
                _forgot(),
                const SizedBox(height: 32),
                _loginBtn(),
                const SizedBox(height: 28),
                _divider(),
                const SizedBox(height: 24),
                _socialBtns(),
                const SizedBox(height: 44),
                _signUp(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoRow() => Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: _primary, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text('R',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: _primary))),
          ),
          const SizedBox(width: 12),
          Text('Rawaan',
              style: GoogleFonts.lato(
                  fontSize: 20, fontWeight: FontWeight.w700, color: _text1)),
        ],
      );

  Widget _header() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello Again!',
              style: GoogleFonts.lato(
                  fontSize: 30, fontWeight: FontWeight.w700, color: _text1)),
          const SizedBox(height: 8),
          Text('Welcome back, sign in to continue',
              style: GoogleFonts.lato(fontSize: 15, color: _text2)),
        ],
      );

  Widget _label(String text) => Text(text,
      style: GoogleFonts.lato(
          fontSize: 13, fontWeight: FontWeight.w600, color: _text2));

  Widget _input(
          TextEditingController c, String hint, IconData icon, bool isPwd) =>
      Container(
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border)),
        child: TextFormField(
          controller: c,
          obscureText: isPwd && !_isPasswordVisible,
          style: GoogleFonts.lato(fontSize: 15, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.lato(fontSize: 15, color: _text3),
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

  Widget _forgot() => Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: Text('Forgot password?',
                style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _primary,
                    fontWeight: FontWeight.w600))),
      );

  Widget _loginBtn() => SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton(
          onPressed:
              _isLoading ? null : () => setState(() => _isLoading = true),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: _primary, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: _isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: _primary, strokeWidth: 2))
              : Text('Sign In',
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _primary)),
        ),
      );

  Widget _divider() => Row(
        children: [
          Expanded(child: Divider(color: _border)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('or',
                  style: GoogleFonts.lato(fontSize: 13, color: _text3))),
          Expanded(child: Divider(color: _border)),
        ],
      );

  Widget _socialBtns() => Row(
        children: [
          Expanded(child: _socialBtn(Icons.g_mobiledata, 'Google')),
          const SizedBox(width: 12),
          Expanded(child: _socialBtn(Icons.apple, 'Apple')),
        ],
      );

  Widget _socialBtn(IconData icon, String label) => Container(
        height: 50,
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border)),
        child: TextButton(
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, color: _text1, size: 22),
            const SizedBox(width: 8),
            Text(label,
                style: GoogleFonts.lato(
                    fontSize: 14, color: _text1, fontWeight: FontWeight.w600)),
          ]),
        ),
      );

  Widget _signUp() => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ",
                style: GoogleFonts.lato(fontSize: 14, color: _text2)),
            GestureDetector(
                onTap: () {},
                child: Text('Sign up',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: _primary,
                        fontWeight: FontWeight.w700))),
          ],
        ),
      );
}
