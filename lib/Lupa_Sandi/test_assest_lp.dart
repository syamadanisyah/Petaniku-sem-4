import 'package:flutter/material.dart';
import 'package:petaniku2/Lupa_Sandi/OTP.dart';
//import 'package:pinput/pinput.dart';

class test_asset_lp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return OTP_dinamis();
  }
}

class OTP_dinamis extends StatefulWidget {


  @override
  State<OTP_dinamis> createState() => _OTP_dinamisState();
}

class _OTP_dinamisState extends State<OTP_dinamis> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
         
            
         Container(
          width: 200,
          height: 200,
          child: OTP_lp()
          ),
          
        ],
      ),
      
    );
  }
}