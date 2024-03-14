import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Lupa_Sandi/button_lp.dart';
import 'package:petaniku2/Lupa_Sandi/textfield_email_lp.dart';

class design_lupa_password extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          children: [
            SizedBox(height: 210,),

            Container(
              width: 250,
              child: Text("Lupa sandi atau ganti sandi",maxLines: 2,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                )
                ),
                ),
            ),
              Text("Masukan Email anda ",
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w400)
              ),
              ),
           Container(
            
            padding: EdgeInsets.all(13),
            child: textfield_email_lp()
            ),
        SizedBox(height: 40,),
            Container(
              width: 250,
              height: 45,
              child: button_lp() ,
            )
           
          ],
        ),
      ),
    );
  }
}