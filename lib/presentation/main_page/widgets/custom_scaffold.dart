import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBackButton;

  const CustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.showBackButton = true, // By default, show back button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 24,
            color: const Color(0xFF0278A9),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF00A1B6),
        leading: showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(), // Go back
              )
            : null, // Hide back button on home page
      ),
      body: body,
    );
  }
}
