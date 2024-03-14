import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class textButton_registrasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Daftar Sekarang",
          style: GoogleFonts.urbanist(color: warna.hijau,
          fontWeight: FontWeight.w700),
        ));
  }
}
