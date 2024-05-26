import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/page/design_list_kategori.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class button_kategori_barang extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {

        Get.to(
          design_list_kategori()
        );

      // Navigator.push(context, 
      // MaterialPageRoute(builder: (context) => design_list_kategori(),));
    }, 
    
style: ElevatedButton.styleFrom(
  backgroundColor: warna.hijau,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    
  )
),

    child: Text("KATEGORI",style: stylefont().buton_kategori_barang,)

    );
  }
}