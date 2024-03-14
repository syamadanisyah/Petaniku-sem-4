import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class button_lp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
         height: 55.0,
      width: 330.0,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: warna.hijau,
           // primary: warna.abu_abu,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          onPressed: () {
            
          },
          
          child: Text('Lanjut',
          style: stylefont().body
          ),
        ),
    );
  }
}