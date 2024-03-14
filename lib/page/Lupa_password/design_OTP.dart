import 'package:flutter/material.dart';
import 'package:petaniku2/Lupa_Sandi/button_lp.dart';
import 'package:pinput/pinput.dart';

class design_otp_validasi extends StatefulWidget {
  const design_otp_validasi({super.key});

  @override
  State<design_otp_validasi> createState() => _design_otp_validasiState();
}

class _design_otp_validasiState extends State<design_otp_validasi> {

  final otp_tema = PinTheme(
     width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),


  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Pinput(
            length: 5,
            defaultPinTheme: otp_tema,
            onCompleted: (value) {
              return print(value);
            },
          ),

          SizedBox(height: 50,),

          button_lp()
          ],
        ),
      ),
    );
  }
}