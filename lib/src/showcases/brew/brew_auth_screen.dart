import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawaan_vault/src/showcases/brew/brew_otp_screen.dart';

class BrewAuthScreen extends StatefulWidget {
  const BrewAuthScreen({super.key});

  @override
  State<BrewAuthScreen> createState() => _BrewAuthScreenState();
}

class _BrewAuthScreenState extends State<BrewAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Brew",
                style: GoogleFonts.luckiestGuy(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 3,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Lets get you started with Brew",
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Brew is the best way to get your coffee. Discover premium blends, order ahead, and enjoy freshly crafted drinks delivered to your doorstep.",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              cursorColor: Colors.red,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Colors.red,
                  size: 22,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: "+92 xxx xxx xxxx",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey.shade400,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BrewOtpScreen()),
                );
              },
              child: Text(
                'Continue to Brew'.toUpperCase(),
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
