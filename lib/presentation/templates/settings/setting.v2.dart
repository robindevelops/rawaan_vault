import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Settings v2 - Profile Settings Screen
class SettingV2Screen extends StatefulWidget {
  const SettingV2Screen({super.key});

  @override
  State<SettingV2Screen> createState() => _SettingV2ScreenState();
}

class _SettingV2ScreenState extends State<SettingV2Screen> {
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _card = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textSec = Color(0xFF888888);
  static const Color _border = Color(0xFF2A2A2A);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 32),
                _avatar(),
                const SizedBox(height: 32),
                _inputField('Full Name', 'Rawaan User'),
                _inputField('Email', 'rawaan@email.com'),
                _inputField('Phone', '+1 234 567 8900'),
                _inputField('Date of Birth', '01/01/1990'),
                const SizedBox(height: 32),
                _saveBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _card, borderRadius: BorderRadius.circular(12)),
              child:
                  const Icon(Icons.arrow_back_ios_new, color: _text, size: 18),
            ),
          ),
          const SizedBox(width: 16),
          Text('Edit Profile',
              style: GoogleFonts.inter(
                  color: _text, fontSize: 20, fontWeight: FontWeight.w600)),
        ],
      );

  Widget _avatar() => Center(
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: _border)),
              child: const Center(
                  child: Text('R',
                      style: TextStyle(
                          color: _text,
                          fontSize: 40,
                          fontWeight: FontWeight.bold))),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: _text, shape: BoxShape.circle),
                child: Icon(Icons.camera_alt, color: _bg, size: 18),
              ),
            ),
          ],
        ),
      );

  Widget _inputField(String label, String value) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: GoogleFonts.inter(color: _textSec, fontSize: 13)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: _border)),
              child: Row(
                children: [
                  Expanded(
                      child: Text(value,
                          style:
                              GoogleFonts.inter(color: _text, fontSize: 15))),
                  Icon(Icons.edit_outlined, color: _textSec, size: 18),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _saveBtn() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: _text, borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: Text('Save Changes',
                style: GoogleFonts.inter(
                    color: _bg, fontSize: 15, fontWeight: FontWeight.w600))),
      );
}
