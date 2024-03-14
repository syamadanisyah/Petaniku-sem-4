import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class button_halaman_bantuan_dashboard extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: () {
        
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(200, 30)
      ),
       child: Text("Halaman bantuan",
       style: GoogleFonts.urbanist(
        textStyle:TextStyle(fontSize: 18,
          fontWeight: FontWeight.w700,
          color: warna.hijau
        ), 
        ),
        )
       ),
    );

  }
}