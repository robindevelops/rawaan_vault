import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V26 - Pearl Gray Theme
/// Card-based layout, filled button, elegant pearl gray tones
/// Palette: Pearl (#F9FAFB), Silver (#9CA3AF), Graphite (#374151)
class AuthV26Screen extends StatefulWidget {
  const AuthV26Screen({super.key});
  @override
  State<AuthV26Screen> createState() => _AuthV26ScreenState();
}

class _AuthV26ScreenState extends State<AuthV26Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFF9FAFB);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _border = Color(0xFFE5E7EB);
  static const Color _primary = Color(0xFF374151);
  static const Color _text1 = Color(0xFF111827);
  static const Color _text2 = Color(0xFF6B7280);
  static const Color _text3 = Color(0xFF9CA3AF);

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  _card(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _card() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: _border)),
        child: Column(
          children: [
            _logo(),
            const SizedBox(height: 28),
            _header(),
            const SizedBox(height: 32),
            _input(
                _emailController, 'Email Address', Icons.email_outlined, false),
            const SizedBox(height: 14),
            _input(_passwordController, 'Password', Icons.lock_outline, true),
            const SizedBox(height: 10),
            _forgot(),
            const SizedBox(height: 28),
            _loginBtn(),
            const SizedBox(height: 24),
            _divider(),
            const SizedBox(height: 20),
            _socialBtns(),
            const SizedBox(height: 24),
            _signUp(),
          ],
        ),
      );

  Widget _logo() => Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
            color: _primary, borderRadius: BorderRadius.circular(14)),
        child: const Center(
            child: Text('R',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700))),
      );

  Widget _header() => Column(
        children: [
          Text('Sign in',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600, color: _text1)),
          const SizedBox(height: 6),
          Text('Access your account',
              style: GoogleFonts.poppins(fontSize: 14, color: _text2)),
        ],
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
          style: GoogleFonts.poppins(fontSize: 14, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: 14, color: _text3),
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
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: _primary,
                    fontWeight: FontWeight.w500))),
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
                  borderRadius: BorderRadius.circular(10))),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : Text('Sign In',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
        ),
      );

  Widget _divider() => Row(
        children: [
          Expanded(child: Divider(color: _border)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('or continue with',
                  style: GoogleFonts.poppins(fontSize: 12, color: _text3))),
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
        height: 46,
        decoration: BoxDecoration(
            color: _bg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border)),
        child: TextButton(
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, color: _text1, size: 20),
            const SizedBox(width: 6),
            Text(label,
                style: GoogleFonts.poppins(
                    fontSize: 13, color: _text1, fontWeight: FontWeight.w500)),
          ]),
        ),
      );

  Widget _signUp() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("New here? ",
              style: GoogleFonts.poppins(fontSize: 13, color: _text2)),
          GestureDetector(
              onTap: () {},
              child: Text('Create account',
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: _primary,
                      fontWeight: FontWeight.w600))),
        ],
      );
}
