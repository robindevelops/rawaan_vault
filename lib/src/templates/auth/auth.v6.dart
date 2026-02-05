import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthV6Screen extends StatefulWidget {
  const AuthV6Screen({super.key});

  @override
  State<AuthV6Screen> createState() => _AuthV6ScreenState();
}

class _AuthV6ScreenState extends State<AuthV6Screen> {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout

    return Scaffold(
      // resizeToAvoidBottomInset ensures keyboard doesn't break layout
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // 1. Background Image (Cityscape)
            Positioned.fill(
              child: Image.network(
                "https://images.pexels.com/photos/378570/pexels-photo-378570.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                fit: BoxFit.cover,
              ),
            ),

            // 2. White Overlay (To wash out the background)
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.75),
              ),
            ),

            // 3. Main Content
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),

                      // Logo
                      Text(
                        "Rawaan".toUpperCase(),
                        style: GoogleFonts.badScript(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 80),

                      // Input Fields Group
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Phone Input
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone_outlined,
                                    color: Colors.grey),
                                hintText: "+92 00000000000",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),

                            // Divider Line
                            Divider(height: 1, color: Colors.grey.shade300),

                            // Password Input
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: Colors.grey),
                                hintText: "**********",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF444444), // Dark Grey
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Sharp corners
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Forgot Password
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),

                      // Social Icons (Footer)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(FontAwesomeIcons.google),
                          const SizedBox(width: 40),
                          _buildSocialIcon(
                            FontAwesomeIcons.facebook,
                          ), // Represents Twitter/X
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(
      icon,
      // color: Colors.black87,
      size: 30,
    );
  }
}
