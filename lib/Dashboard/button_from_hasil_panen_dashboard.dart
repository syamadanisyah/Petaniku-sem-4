import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:petaniku2/page/hasil_panen/halaman_postingan.dart';
import 'package:petaniku2/warna/warna.dart';

class button_halaman_hasil_panen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Get.to(
        halaman_postingan()
      );
    },style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(12)
      ),
      fixedSize: Size(200, 30)
    ),
     child: Text(" hasil panen",
    style: GoogleFonts.urbanist(textStyle: TextStyle(
      fontSize: 19,fontWeight: FontWeight.w700,color: warna.hijau
    ,)
    ),
    )
    );
  }
}