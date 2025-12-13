import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// AUTH V25 - Cool Mist Theme
/// Centered layout, soft shadow button, cool gray-blue mist tones
/// Palette: Mist (#F4F6F8), Cool Gray (#6C7A89), Storm (#4A5568)
class AuthV25Screen extends StatefulWidget {
  const AuthV25Screen({super.key});
  @override
  State<AuthV25Screen> createState() => _AuthV25ScreenState();
}

class _AuthV25ScreenState extends State<AuthV25Screen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  static const Color _bg = Color(0xFFF4F6F8);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _border = Color(0xFFE1E5EB);
  static const Color _primary = Color(0xFF4A5568);
  static const Color _text1 = Color(0xFF2D3748);
  static const Color _text2 = Color(0xFF6C7A89);
  static const Color _text3 = Color(0xFFA0AEC0);

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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  _logo(),
                  const SizedBox(height: 44),
                  _header(),
                  const SizedBox(height: 36),
                  _input(
                      _emailController, 'Email', Icons.person_outline, false),
                  const SizedBox(height: 16),
                  _input(_passwordController, 'Password', Icons.lock_outline,
                      true),
                  const SizedBox(height: 14),
                  _forgot(),
                  const SizedBox(height: 30),
                  _loginBtn(),
                  const SizedBox(height: 26),
                  _divider(),
                  const SizedBox(height: 22),
                  _socialBtns(),
                  const SizedBox(height: 40),
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

  Widget _logo() => Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 4))
          ],
        ),
        child: Center(
            child: Text('R',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: _primary))),
      );

  Widget _header() => Column(
        children: [
          Text('Welcome Back',
              style: GoogleFonts.spaceGrotesk(
                  fontSize: 28, fontWeight: FontWeight.w600, color: _text1)),
          const SizedBox(height: 8),
          Text('Enter your credentials to access your account',
              style: GoogleFonts.spaceGrotesk(fontSize: 14, color: _text2)),
        ],
      );

  Widget _input(
          TextEditingController c, String hint, IconData icon, bool isPwd) =>
      Container(
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: TextFormField(
          controller: c,
          obscureText: isPwd && !_isPasswordVisible,
          style: GoogleFonts.spaceGrotesk(fontSize: 15, color: _text1),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.spaceGrotesk(fontSize: 15, color: _text3),
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
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 13, color: _text2, fontWeight: FontWeight.w500))),
      );

  Widget _loginBtn() => Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: _primary.withOpacity(0.2),
                blurRadius: 16,
                offset: const Offset(0, 6))
          ],
        ),
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
                  style: GoogleFonts.spaceGrotesk(
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
              child: Text('OR',
                  style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: _text3,
                      fontWeight: FontWeight.w500))),
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
        height: 48,
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: IconButton(
            onPressed: () {}, icon: Icon(icon, color: _text1, size: 22)),
      );

  Widget _signUp() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ",
              style: GoogleFonts.spaceGrotesk(fontSize: 14, color: _text2)),
          GestureDetector(
              onTap: () {},
              child: Text('Sign up',
                  style: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      color: _primary,
                      fontWeight: FontWeight.w600))),
        ],
      );
}
