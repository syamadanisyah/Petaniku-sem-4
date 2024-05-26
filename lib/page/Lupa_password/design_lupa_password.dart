import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Lupa_Sandi/button_lp.dart';
import 'package:petaniku2/Lupa_Sandi/textfield_email_lp.dart';
import 'package:http/http.dart' as http;
import 'package:petaniku2/page/Lupa_password/design_OTP.dart';
import 'dart:convert';

import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class design_lupa_password extends StatefulWidget {
  @override
  State<design_lupa_password> createState() => _design_lupa_passwordState();
}

class _design_lupa_passwordState extends State<design_lupa_password> {
  
  Future<void> sendOtp(BuildContext context, String email) async {
    try {
      final response = await http.post(
        PetaniKuConstant.baseUrl('send-otp'),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          var otp = responseData['data']['otp'];
          print('otp anda : $otp');

          Get.to(design_otp_validasi(
            otp: otp,
            emai: textEmail.text,
          ));
        } else {
          // Kesalahan dari server (misalnya, email tidak terdaftar)
          _showErrorDialog(context, responseData['message']);
        }
      } else {
        // Kesalahan HTTP
        _showErrorDialog(context, "Gagal mengirim OTP. Silakan coba lagi.");
      }
    } catch (error) {
      // Kesalahan jaringan atau lainnya
      _showErrorDialog(context, "Terjadi kesalahan. Silakan coba lagi.");
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  TextEditingController textEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 210,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              width: 450,
              child: Text(
                "Lupa sandi atau",
                maxLines: 2,
                
                style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              width: 450,
              child: Text(
                "ganti sandi",
                maxLines: 2,
                style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),




            Container(
              margin: EdgeInsets.only(left:15),
              // alignment: Alignment.centerLeft,
              child: Text(
                "Masukan Email anda ",
                style: GoogleFonts.urbanist(
                    textStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              child: TextField(
                controller: textEmail,
                style: GoogleFonts.urbanist(),
                decoration: InputDecoration(
                  labelText: "Masukan Email yang terdaftar",
                  labelStyle: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600, color: warna.hijau)),
                  fillColor: warna.abu_abu,
                  filled: true,
                  // hintText: 'j',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              height: 55.0,
              width: 330.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: warna.hijau,
                    // primary: warna.abu_abu,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  await sendOtp(context, textEmail.text);
                },
                child: Text('Lanjut', style: stylefont().body),
              ),
            )
          ],
        ),
      ),
    );
  }
}
