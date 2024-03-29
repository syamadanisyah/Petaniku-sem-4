import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/design_asset_login/button_login.dart';
import 'package:petaniku2/design_asset_login/textButton_lupa_psw.dart';
import 'package:petaniku2/design_asset_login/textButton_regis.dart';
import 'package:petaniku2/design_asset_login/textfield_login.dart';
import 'package:petaniku2/design_asset_login/textfield_login_password.dart';
import 'package:petaniku2/warna/warna.dart';

class design_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Text(
                    "Selamat Datang!",
                    style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Text(
                    "Anda berada di aplikasi PETANIKU",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                ),
               /* Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Email",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 17)),
                ),*/
                textfield_login_email(),
                SizedBox(
                  height: 30,
                ),
               /* Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Password",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 17)),
                ),*/
                textfield_login_password(),
                Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 10),
                    child: textbutton_login_LP()),
                Container(
                    alignment: Alignment.center, child: button_login_email()),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      width: 120,
                      height: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Or Login With",
                      style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                              color: warna.warna_Lupa_password,
                              fontWeight: FontWeight.w600,
                              fontSize: 15 )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      width: 120,
                      height: 1,
                    ),
                   
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.only(top:20),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text("Anda tidak punya akun?"),
                       Container(
                            child: textButton_registrasi(),
                          ),
                     ],
                   ),
                 ),
              ],
            ),
          ),
        ));
  }
}
