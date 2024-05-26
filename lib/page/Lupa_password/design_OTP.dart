import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Lupa_Sandi/button_lp.dart';
import 'package:petaniku2/page/Lupa_password/design_verifikasi_sandi.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:pinput/pinput.dart';

class design_otp_validasi extends StatefulWidget {
  const design_otp_validasi({
    super.key,
    required this.otp,
    required this.emai,
  });

  final String otp;
  final String emai;

  @override
  State<design_otp_validasi> createState() => _design_otp_validasiState();
}

class _design_otp_validasiState extends State<design_otp_validasi> {
  
  final otp_tema = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(202, 204, 206, 1),
      width: 3),
      borderRadius: BorderRadius.circular(20),
    ),
  );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           Container(
            child: Text("Masuka kode OTP yang",
            style: GoogleFonts.urbanist(
            textStyle : TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.bold
            ),
            ),
            ),
           ),
           Container(
            child: Text("sudah di kirim melalui Email",
            style: GoogleFonts.urbanist(
              textStyle :TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              )
            ),),
           ),

       SizedBox(
        height: 30,
       ),

            Pinput(
              length: 5,
              defaultPinTheme: otp_tema,
              onCompleted: (value) {
                if (value == widget.otp) {
                  Get.to(design_verifikasi_sandi(
                    emai: widget.emai,
                  ));
                } else {
                  _showErrorDialog(context, 'OTP Tidak Cocok');
                }
              },
            ),
            SizedBox(
              height: 50,
            ),
            /**
        
          button_lp()
        */
            Container(
              height: 55,
              width: 330,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Lanjut",
                  style: stylefont().body,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: warna.hijau,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
