import 'package:flutter/material.dart';
import 'package:petaniku2/Lupa_Sandi/button_lp.dart';
import 'package:petaniku2/Lupa_Sandi/textfield_sandi_baru.dart';
import 'package:petaniku2/Lupa_Sandi/textfield_verifikasi_sandi.dart';

class design_verifikasi_sandi extends StatefulWidget {
 

  @override
  State<design_verifikasi_sandi> createState() => _design_verifikasi_sandiState();
}

class _design_verifikasi_sandiState extends State<design_verifikasi_sandi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 250,),
          Container(
            child: textfield_sandi_baru("")
            ),
             SizedBox(height: 30,),
            Container(
            child: textfield_verifikasi_sandi("")
            ),
            SizedBox(height: 30,),
            Container(
              
              child: button_lp())
        ],
      ),
    );
  }
}