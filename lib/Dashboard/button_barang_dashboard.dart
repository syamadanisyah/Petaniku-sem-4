import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class button_barang_dashboard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton( 
        
        onPressed: () {
        
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        fixedSize: Size(200, 20),
      ),
       child: Padding(
         padding: const EdgeInsets.all(10),
         child: Text("Produk Tani",
         style: GoogleFonts.urbanist(
          textStyle: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,
          color: warna.hijau,
          )
         ),
         ),
       ),
      );
    
  }
}