import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
     
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_horiz,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
