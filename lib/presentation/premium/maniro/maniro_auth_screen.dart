import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/presentation/premium/maniro/maniro_home_screen.dart';

/// Maniro Auth Screen
/// Features: Login/Signup tabs, email/password fields, social login, forgot password
class ManiroAuthScreen extends StatefulWidget {
  final bool isLogin;

  const ManiroAuthScreen({super.key, this.isLogin = true});

  @override
  State<ManiroAuthScreen> createState() => _ManiroAuthScreenState();
}

class _ManiroAuthScreenState extends State<ManiroAuthScreen>
    with SingleTickerProviderStateMixin {
  static const Color _primaryBlack = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF6B7280);
  static const Color _backgroundGrey = Color(0xFFF8F9FA);
  static const Color _borderGrey = Color(0xFFE5E7EB);

  late TabController _tabController;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.isLogin ? 0 : 1,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLoginTab(),
                  _buildSignupTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: _backgroundGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back,
                      color: _primaryBlack, size: 22),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Welcome to Maniro',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: _primaryBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sign in to continue shopping',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: _textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: _primaryBlack,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(4),
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: _textGrey,
        labelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        tabs: const [
          Tab(text: 'Sign In'),
          Tab(text: 'Sign Up'),
        ],
      ),
    );
  }

  Widget _buildLoginTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            hintText: 'Enter your password',
            prefixIcon: Icons.lock_outline,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: _textGrey,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlack,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildPrimaryButton('Sign In', onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ManiroHomeScreen()),
            );
          }),
          const SizedBox(height: 32),
          _buildDivider(),
          const SizedBox(height: 24),
          _buildSocialButtons(),
        ],
      ),
    );
  }

  Widget _buildSignupTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _buildTextField(
            controller: _nameController,
            label: 'Full Name',
            hintText: 'Enter your full name',
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            hintText: 'Create a password',
            prefixIcon: Icons.lock_outline,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: _textGrey,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            hintText: 'Confirm your password',
            prefixIcon: Icons.lock_outline,
            obscureText: _obscureConfirmPassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: _textGrey,
              ),
              onPressed: () => setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword),
            ),
          ),
          const SizedBox(height: 32),
          _buildPrimaryButton('Create Account', onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ManiroHomeScreen()),
            );
          }),
          const SizedBox(height: 24),
          _buildDivider(),
          const SizedBox(height: 24),
          _buildSocialButtons(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _primaryBlack,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: GoogleFonts.inter(
            fontSize: 15,
            color: _primaryBlack,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontSize: 15,
              color: _textGrey,
            ),
            prefixIcon: Icon(prefixIcon, color: _textGrey, size: 22),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: _backgroundGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: _primaryBlack, width: 1.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(String text, {required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryBlack,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: _borderGrey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or continue with',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: _textGrey,
            ),
          ),
        ),
        Expanded(child: Divider(color: _borderGrey)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('G', Colors.red),
        const SizedBox(width: 16),
        _buildSocialButton('f', const Color(0xFF1877F2)),
        const SizedBox(width: 16),
        _buildSocialButton('', _primaryBlack, icon: Icons.apple),
      ],
    );
  }

  Widget _buildSocialButton(String text, Color color, {IconData? icon}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: _backgroundGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderGrey),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: color, size: 28)
            : Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
      ),
    );
  }
}
