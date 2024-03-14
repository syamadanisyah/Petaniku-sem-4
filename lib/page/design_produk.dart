import 'package:flutter/material.dart';
import 'package:petaniku2/produk/box_diskripsi.dart';
import 'package:petaniku2/produk/design_button_fav.dart';
import 'package:petaniku2/produk/gambar_produk.dart';
import 'package:petaniku2/produk/scroll_horizontal_produk.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';


class design_produk extends StatelessWidget {
  const design_produk({super.key});

  @override
  Widget build(BuildContext context) {
    return produk_dinamis();
  }
}

class produk_dinamis extends StatefulWidget {
  const produk_dinamis({
    super.key,
  });

  @override
  State<produk_dinamis> createState() => _produk_dinamisState();
}

class _produk_dinamisState extends State<produk_dinamis> {
  @override
  Widget build(BuildContext context) {

final mediaquerywidth = MediaQuery.of(context).size.width;
final mediaqueryheigh = MediaQuery.of(context).size.height;

    return Scaffold(
     body: SingleChildScrollView(
      child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
               Container(
                child: gambar_produk()
               ),
               SizedBox(height: 10,),
              Container(
                color: warna.hijau,
                height: 80,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7,),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Nama produk",style: stylefont().body,)
                          ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Rp150.000",style: stylefont().body,),
                        ),
                      ],
                    ),
                    SizedBox(width: 170,),
                    Container(

                      child: button_wishlist(),
                    ),
                  ],
                ),
              ),
        
              Container(
                height: 200,
                child: box_diskripsi(),
                ),
               


              Container(
               //untuk memanggil scroll horizontal harus memberi nilai ukuran pada container jika tidak akan mengalami error rendering box

                 height: mediaqueryheigh*0.5,
                 width: mediaquerywidth*1,
                 decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                   color: warna.hijau
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: scroll_horizontal_produk(),
                  ) ,
                ),
        
            ],
          ),
        ), 
     ),

    );
  }
}