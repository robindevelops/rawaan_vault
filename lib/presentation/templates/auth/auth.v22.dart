import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V22 - Slate Blue Theme
/// Centered layout, calm slate blue tones, filled button
/// Palette: Light Blue-Gray (#F5F7FA), Slate (#64748B), Navy (#334155)
class AuthV22Screen extends StatefulWidget {
  const AuthV22Screen({super.key});
  @override
  State<AuthV22Screen> createState() => _AuthV22ScreenState();
}

class _AuthV22ScreenState extends State<AuthV22Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFF8FAFC);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _border = Color(0xFFE2E8F0);
  static const Color _primary = Color(0xFF334155);
  static const Color _text1 = Color(0xFF1E293B);
  static const Color _text2 = Color(0xFF64748B);
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
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  _logo(),
                  const SizedBox(height: 40),
                  _header(),
                  const SizedBox(height: 36),
                  _input(_emailController, 'Email', Icons.mail_outline, false),
                  const SizedBox(height: 16),
                  _input(_passwordController, 'Password', Icons.lock_outline,
                      true),
                  const SizedBox(height: 12),
                  _forgot(),
                  const SizedBox(height: 28),
                  _loginBtn(),
                  const SizedBox(height: 28),
                  _divider(),
                  const SizedBox(height: 24),
                  _social(),
                  const SizedBox(height: 36),
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

  Widget _logo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: _primary, borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text('R',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700))),
          ),
          const SizedBox(width: 12),
          Text('Rawaan',
              style: GoogleFonts.outfit(
                  fontSize: 24, fontWeight: FontWeight.w600, color: _text1)),
        ],
      );

  Widget _header() => Column(
        children: [
          Text('Welcome back',
              style: GoogleFonts.outfit(
                  fontSize: 26, fontWeight: FontWeight.w600, color: _text1)),
          const SizedBox(height: 8),
          Text('Please enter your credentials',
              style: GoogleFonts.outfit(fontSize: 15, color: _text2)),
        ],
      );

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
          style: GoogleFonts.outfit(fontSize: 15, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.outfit(fontSize: 15, color: _text3),
            prefixIcon: Icon(icon, color: _text3, size: 20),
            suffixIcon: isPwd
                ? IconButton(
                    icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
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
              style: GoogleFonts.outfit(
                  fontSize: 13, color: _text2, fontWeight: FontWeight.w500)),
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
                  borderRadius: BorderRadius.circular(10))),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : Text('Sign In',
                  style: GoogleFonts.outfit(
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
              child: Text('Or',
                  style: GoogleFonts.outfit(fontSize: 13, color: _text3))),
          Expanded(child: Divider(color: _border)),
        ],
      );

  Widget _social() => Row(
        children: [
          Expanded(child: _socialBtn(Icons.g_mobiledata, 'Google')),
          const SizedBox(width: 12),
          Expanded(child: _socialBtn(Icons.apple, 'Apple')),
        ],
      );

  Widget _socialBtn(IconData icon, String label) => Container(
        height: 48,
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
                style: GoogleFonts.outfit(
                    fontSize: 14, color: _text1, fontWeight: FontWeight.w500)),
          ]),
        ),
      );

  Widget _signUp() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ",
              style: GoogleFonts.outfit(fontSize: 14, color: _text2)),
          GestureDetector(
              onTap: () {},
              child: Text('Sign up',
                  style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: _primary,
                      fontWeight: FontWeight.w600))),
        ],
      );
}
