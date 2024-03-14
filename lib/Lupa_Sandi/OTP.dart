import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

//import 'package:pinput/pinput.dart';

class OTP_lp extends StatefulWidget {
 

  @override
  State<OTP_lp> createState() => _OTP_lpState();
}

class _OTP_lpState extends State<OTP_lp> {
  
  
   

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
     // defaultPinTheme: otp_tema,
      onCompleted: (value) {
        return print(value);
      },
    );

  }

}

