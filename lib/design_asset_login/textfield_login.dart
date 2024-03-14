import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class textfield_login_email extends StatelessWidget {
  
final String? hint;

const textfield_login_email({this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
       
      style: GoogleFonts.urbanist(),
      decoration: InputDecoration(
        labelText: "Masukan Email Anda",
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
      ),
      
    );
  }
}