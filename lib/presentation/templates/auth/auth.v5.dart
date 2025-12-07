import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthV5Screen extends StatefulWidget {
  const AuthV5Screen({super.key});

  @override
  State<AuthV5Screen> createState() => _AuthV5ScreenState();
}

class _AuthV5ScreenState extends State<AuthV5Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final primaryColor = const Color.fromARGB(255, 81, 13, 93);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF3E1B4F), // Darker Deep Purple
              const Color(0xFF6A1B9A), // Lighter Purple
              const Color.fromARGB(255, 23, 23, 62), // Deep Navy
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Header
              Icon(Icons.layers_outlined, color: Colors.white, size: 50),
              const SizedBox(height: 10),
              Text(
                "WORKSPACE",
                style: GoogleFonts.aboreto(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30),

              // Main Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Tab Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey[600],
                            labelStyle: GoogleFonts.abel(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            tabs: const [
                              Tab(text: "Log In"),
                              Tab(text: "Sign Up"),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Tab Views
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Login Form
                            _buildLoginForm(primaryColor),
                            // Sign Up Form
                            _buildSignUpForm(primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(Color color) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildTextField(label: "Email Address", icon: Icons.email_outlined),
          const SizedBox(height: 20),
          _buildTextField(
              label: "Password", icon: Icons.lock_outline, isPassword: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style:
                    GoogleFonts.abel(color: color, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildButton("Log In", color),
          const SizedBox(height: 30),
          _buildSocialLogin(),
        ],
      ),
    );
  }

  Widget _buildSignUpForm(Color color) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildTextField(label: "Full Name", icon: Icons.person_outline),
          const SizedBox(height: 20),
          _buildTextField(label: "Email Address", icon: Icons.email_outlined),
          const SizedBox(height: 20),
          _buildTextField(
              label: "Password", icon: Icons.lock_outline, isPassword: true),
          const SizedBox(height: 30),
          _buildButton("Create Account", color),
          const SizedBox(height: 30),
          Text(
            "By creating an account you agree to our Terms of Service and Privacy Policy",
            textAlign: TextAlign.center,
            style: GoogleFonts.abel(color: Colors.grey[500], fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required IconData icon,
      bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        labelStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 81, 13, 93), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        shadowColor: color.withOpacity(0.4),
      ),
      child: Text(
        text,
        style: GoogleFonts.abel(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Or continue with",
                style: GoogleFonts.abel(color: Colors.grey[500]),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialBtn(Icons.g_mobiledata, Colors.red), // Fake Google Icon
            _buildSocialBtn(Icons.apple, Colors.black),
            _buildSocialBtn(Icons.facebook, const Color(0xFF1877F2)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialBtn(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}
