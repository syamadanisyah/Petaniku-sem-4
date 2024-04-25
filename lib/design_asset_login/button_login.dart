import 'package:flutter/material.dart';
import 'package:petaniku2/warna/warna.dart';

class button_login_email extends StatelessWidget {
  final VoidCallback onPressed;

  const button_login_email({
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 55.0,
      width: 350.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: warna.hijau,
         // primary: warna.abu_abu,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        onPressed: onPressed,
        
        child: Text('Login'
        ,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}