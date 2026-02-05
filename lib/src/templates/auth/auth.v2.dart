import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthV2Screen extends StatefulWidget {
  const AuthV2Screen({super.key});

  @override
  State<AuthV2Screen> createState() => _AuthV2ScreenState();
}

class _AuthV2ScreenState extends State<AuthV2Screen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ----------- TAP ANYWHERE OUTSIDE TEXTFIELD → HIDE KEYBOARD -----------
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RAWAAN",
                  style: GoogleFonts.fjallaOne(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Reliable. Responsible. Responsive.",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ---------------- TOP SECTION ----------------
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "ENTER YOUR PHONE NUMBER",
                          style: GoogleFonts.fjallaOne(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          "We'll send you a verification code to your phone number",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // ---------------- PHONE FIELD ----------------
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            style: GoogleFonts.poppins(fontSize: 16),

                            // VALIDATION LOGIC
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Phone number is required";
                              }

                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return "Only digits allowed";
                              }

                              if (value.length < 10 || value.length > 12) {
                                return "Enter a valid phone number";
                              }

                              return null;
                            },

                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  phoneController.clear();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "00 00000000",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.4),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1.4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // ---------------- BUTTON ----------------
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus(); // ALSO CLOSES KEYBOARD
                    if (_formKey.currentState!.validate()) {
                      print("Phone valid: ${phoneController.text}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    elevation: 4,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    "CONTINUE",
                    style: GoogleFonts.fjallaOne(
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ---------------- TERMS ----------------
                Text(
                  "By continuing, you agree to our Terms of Service and Privacy Policy. You also confirm that you are over 18 years old.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12,
                    color: Colors.grey[500],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
