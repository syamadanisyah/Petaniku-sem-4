import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Dashboard/button_barang_dashboard.dart';
import 'package:petaniku2/Dashboard/button_from_bantuan_dashboard.dart';
import 'package:petaniku2/Dashboard/button_from_hasil_panen_dashboard.dart';
import 'package:petaniku2/Dashboard/textfield_searching_dashboard.dart';
import 'package:petaniku2/warna/warna.dart';

class design_dashboard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text("Hello!",
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  ),
                ),
              textfield_searching(),
               Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text("Menu",style: GoogleFonts.urbanist(
                  textStyle:TextStyle(fontSize:25 ,
                  fontWeight: FontWeight.w600) ),
                  ),
              ),
              SizedBox(height: 10,),
              button_barang_dashboard(),
              SizedBox(height: 10,),
              button_halaman_hasil_panen(),
              SizedBox(height: 10,),
              // button_halaman_bantuan_dashboard(),
              SizedBox(height:20 ,),
               Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text("Informasi hasil panen",style: GoogleFonts.urbanist(
                  textStyle:TextStyle(fontSize:25 ,
                  fontWeight: FontWeight.w600) ),
                  ),
              ),
              SizedBox(height: 20,),

              Container(
                width: 350,
                height: 180,
                decoration: BoxDecoration(
                  color: warna.hijau,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent
                  ),
                ),
              ),
              SizedBox(height: 20,),
                  Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text("Informasi",style: GoogleFonts.urbanist(
                  textStyle:TextStyle(fontSize:25 ,
                  fontWeight: FontWeight.w600) ),
                  ),
              ),
                Container(
                width: 350,
                height: 180,
                decoration: BoxDecoration(
                  color: warna.hijau,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent
                  )
                ),
              ),
              SizedBox(height: 10,),
               Container(

                width: 350,
                height: 180,
                decoration: BoxDecoration(
                  color: warna.hijau,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent
                  )
                ),
              ),
             

            ],
          ),
        ),
      ),
    );
  }
}