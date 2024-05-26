import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/page/Lupa_password/design_OTP.dart';
import 'package:petaniku2/warna/warna.dart';

class textfield_email_lp extends StatelessWidget {
  

  final String? hint;

const textfield_email_lp ({this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
       
      style: GoogleFonts.urbanist(),
      decoration: InputDecoration(
        labelText: "Masukan Email yang terdaftar",
        labelStyle: GoogleFonts.urbanist(textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: warna.hijau)
          ),
        fillColor:warna.abu_abu ,
        filled: true,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 2,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none
          ),
      ),
      );
  }
}