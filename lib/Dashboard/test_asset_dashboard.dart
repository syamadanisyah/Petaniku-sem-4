import 'package:flutter/material.dart';
import 'package:petaniku2/Dashboard/button_barang_dashboard.dart';
import 'package:petaniku2/Dashboard/button_from_bantuan_dashboard.dart';
import 'package:petaniku2/Dashboard/button_from_hasil_panen_dashboard.dart';
import 'package:petaniku2/Dashboard/textfield_searching_dashboard.dart';

class test_asset_dashboard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        child: Column(
        children: [
           Container(
            width: 200,
            height: 40,
            
            child: button_barang_dashboard()
            ),
            SizedBox(height: 30,),
             Container(
            width: 200,
            height: 40,
            
            child: button_halaman_bantuan_dashboard()
            ),
            SizedBox(height: 30,),
            Container(
              width: 200,
              height: 40,
              child: button_halaman_hasil_panen() ),
              SizedBox(height: 30,),
            textfield_searching()
           ],
        ),
      ),
    );
  }
}