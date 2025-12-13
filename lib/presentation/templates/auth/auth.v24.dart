import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V24 - Light Linen Theme
/// Top-aligned layout, filled button, natural linen tones
/// Palette: Linen (#FAF9F6), Taupe (#8C7B6B), Espresso (#5D4E3F)
class AuthV24Screen extends StatefulWidget {
  const AuthV24Screen({super.key});
  @override
  State<AuthV24Screen> createState() => _AuthV24ScreenState();
}

class _AuthV24ScreenState extends State<AuthV24Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFFAF9F6);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _border = Color(0xFFE8E4DF);
  static const Color _primary = Color(0xFF5D4E3F);
  static const Color _text1 = Color(0xFF3B3229);
  static const Color _text2 = Color(0xFF8C7B6B);
  static const Color _text3 = Color(0xFFB8A898);

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
                const SizedBox(height: 56),
                _logo(),
                const SizedBox(height: 48),
                _header(),
                const SizedBox(height: 40),
                _input(_emailController, 'Email', Icons.mail_outline, false),
                const SizedBox(height: 16),
                _input(
                    _passwordController, 'Password', Icons.lock_outline, true),
                const SizedBox(height: 12),
                _forgot(),
                const SizedBox(height: 32),
                _loginBtn(),
                const SizedBox(height: 28),
                _divider(),
                const SizedBox(height: 24),
                _socialBtns(),
                const SizedBox(height: 48),
                _signUp(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() => Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: _primary, borderRadius: BorderRadius.circular(12)),
        child: const Center(
            child: Text('R',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))),
      );

  Widget _header() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in to your account'.toUpperCase(),
            style: GoogleFonts.cabin(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: _text1,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Welcome back! Please enter your details.',
            style: GoogleFonts.sora(
              fontSize: 12,
              color: _text2,
            ),
          ),
        ],
      );

  Widget _input(
          TextEditingController c, String hint, IconData icon, bool isPwd) =>
      Container(
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _border)),
        child: TextFormField(
          controller: c,
          obscureText: isPwd && !_isPasswordVisible,
          style: GoogleFonts.sora(fontSize: 14, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.sora(fontSize: 14, color: _text3),
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
                style: GoogleFonts.sora(
                    fontSize: 13,
                    color: _primary,
                    fontWeight: FontWeight.w500))),
      );

  Widget _loginBtn() => SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed:
              _isLoading ? null : () => setState(() => _isLoading = true),
          style: ElevatedButton.styleFrom(
              backgroundColor: _primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : Text('Sign In',
                  style: GoogleFonts.sora(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
        ),
      );

  Widget _divider() => Row(
        children: [
          Expanded(child: Divider(color: _border)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('or',
                  style: GoogleFonts.sora(fontSize: 12, color: _text3))),
          Expanded(child: Divider(color: _border)),
        ],
      );

  Widget _socialBtns() => Row(
        children: [
          Expanded(child: _socialBtn(Icons.g_mobiledata, 'Google')),
          const SizedBox(width: 14),
          Expanded(child: _socialBtn(Icons.apple, 'Apple')),
        ],
      );

  Widget _socialBtn(IconData icon, String label) => Container(
        height: 50,
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _border)),
        child: TextButton(
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, color: _text1, size: 22),
            const SizedBox(width: 8),
            Text(label,
                style: GoogleFonts.sora(
                    fontSize: 14, color: _text1, fontWeight: FontWeight.w500)),
          ]),
        ),
      );

  Widget _signUp() => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ",
                style: GoogleFonts.sora(fontSize: 14, color: _text2)),
            GestureDetector(
                onTap: () {},
                child: Text('Sign up',
                    style: GoogleFonts.sora(
                        fontSize: 14,
                        color: _primary,
                        fontWeight: FontWeight.w600))),
          ],
        ),
      );
}
