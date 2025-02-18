import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 24,
            color: const Color(0xFF0278A9),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF00A1B6),
      ),
      body: Text('ScreenSearch'),
    );
  }
}
