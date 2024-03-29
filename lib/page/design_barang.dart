import 'package:flutter/material.dart';
import 'package:petaniku2/Barang/button_kategori_barang.dart';
import 'package:petaniku2/Barang/slider_barang.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:petaniku2/Barang/scroll_horizontal_barang.dart';
import 'package:petaniku2/Barang/gridview_tombol_popular_barang.dart';

class design_barang extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return stf_barang();
  }
}

class stf_barang extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

 final mediaquerywidth = MediaQuery.of(context).size.width;
final mediaqueryheigh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
         SizedBox(height: 50,),
              Text("Produk tani",
              style: stylefont().Header,
              ),
                Container(
                  //di container harus ada ukuran nya.di kelas ataupun saat pemanggilan harus di bungkus container
                  height: mediaqueryheigh*0.2,
                  width: mediaquerywidth,
                  child: slider_barang()
                  ),
                  
                  SizedBox(height: 70,),
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: button_kategori_barang(),
              ),
        
              Container(
                 margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Text("kategori Terpopuler",
                style: stylefont().Subheader,),
              ),
              SizedBox(height: 20,),
               Container(
               // color: Colors.amber,
                alignment: Alignment.center,
                height: 160,
                  width: 320,
                  //color: Colors.amber,
                 child: gridview_tombol_barang(),

                ),
                SizedBox(height: 30,),
               Container(
                 height: mediaqueryheigh*0.5,
                 width: mediaquerywidth*1,
                 decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                   color: warna.hijau
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: scroll_horizontal_barang(),
                  ) ,
                ),
          
                
            ],
          ),
        ),
      ),
    );
  }
}