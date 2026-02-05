import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class AuthV7Screen extends StatefulWidget {
  const AuthV7Screen({super.key});

  @override
  State<AuthV7Screen> createState() => _AuthV7ScreenState();
}

class _AuthV7ScreenState extends State<AuthV7Screen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  // Theme Colors
  final Color _primaryColor = const Color(0xFF212121); // Jet Black
  final Color _accentColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            // 1. Background Image
            Positioned.fill(
              child: Image.network(
                "https://images.pexels.com/photos/378570/pexels-photo-378570.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                fit: BoxFit.cover,
              ),
            ),

            // 2. Modern Blur & Gradient Overlay (Glassmorphismish)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.9),
                        Colors.white,
                      ],
                      stops: const [0.0, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            // 3. Main Content
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),

                        // --- LOGO ---
                        Column(
                          children: [
                            Text(
                              "RAWAAN",
                              style: TextStyle(
                                color: _accentColor,
                                fontSize: 42,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Roboto',
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(2, 4),
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Your Journey, Elevated.",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // --- INPUT GROUP ---
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Phone Input
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                decoration: _buildInputDecoration(
                                  "Phone Number",
                                  Icons.phone_outlined,
                                  false,
                                ),
                              ),

                              // Divider
                              Divider(
                                height: 1,
                                color: Colors.grey.shade200,
                                thickness: 1,
                                indent: 16,
                                endIndent: 16,
                              ),

                              // Password Input
                              TextFormField(
                                obscureText: !_isPasswordVisible,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                decoration: _buildInputDecoration(
                                  "Password",
                                  Icons.lock_outline,
                                  true, // Is last item
                                ).copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        // --- SIGN IN BUTTON ---
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Perform login action
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Processing...")));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _primaryColor,
                              foregroundColor: Colors.white,
                              shadowColor: _primaryColor.withOpacity(0.4),
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Continue Now",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                // letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // --- FORGOT PASSWORD ---
                        InkWell(
                          onTap: () {
                            // Handle forgot password
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),

                        // --- SOCIAL ICONS ---
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Input Decoration
  InputDecoration _buildInputDecoration(
      String hint, IconData icon, bool isLast) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.grey[500], size: 22),
      hintText: hint,
      hintStyle:
          TextStyle(color: Colors.grey[400], fontWeight: FontWeight.normal),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      // Error styling could go here
    );
  }
}
