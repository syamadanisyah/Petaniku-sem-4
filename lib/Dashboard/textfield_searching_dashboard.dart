import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Dashboard/button_barang_dashboard.dart';
import 'package:petaniku2/warna/warna.dart';

class textfield_searching extends StatelessWidget {
  
 final String ? hint;

    const textfield_searching({this.hint});

  @override
  Widget build(BuildContext context) {

   
    return Container(
      width: 300,
      height: 30,
      child:TextField(

      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14),
        fillColor: warna.warna_searching,
        filled: true,
        hintText: hint??'pencarian',
        hintStyle: GoogleFonts.inter(textStyle: TextStyle(fontWeight: FontWeight.w500)),
        enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.grey.shade300,width: 2),
         borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300,width: 2),
        borderRadius: BorderRadius.circular(20)
        )
       
      ),
      )
    );
  }
}