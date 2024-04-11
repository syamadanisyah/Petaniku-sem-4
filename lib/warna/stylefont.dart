import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class stylefont {

final TextStyle body = TextStyle(
  fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 20
  
);

final TextStyle body_gridview = TextStyle(
  fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.black,

  //wes kenek kan tapi? he eh kenek bang :) anjay tak benakno seyk font e 
  fontSize: 15
  
);


final TextStyle diskripsi_gridview_barang = TextStyle(
 fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.w700,
color: warna.warna_Lupa_password,
fontSize: 15

);

final TextStyle buton_kategori_barang = TextStyle(
  fontSize: 18,
  fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

final TextStyle Header = TextStyle(
  fontSize: 30,
  fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.black
);

final TextStyle Subheader = TextStyle(
  fontSize: 20,
  fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.black
);


final TextStyle Subheader_navbar_produk = TextStyle(
  fontSize: 20,
  fontFamily: GoogleFonts.urbanist().fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.white
);


}