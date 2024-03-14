import 'package:flutter/material.dart';
import 'package:petaniku2/Barang/button_kategori_barang.dart';
import 'package:petaniku2/Barang/gridview_barang.dart';
import 'package:petaniku2/Barang/gridview_tombol_popular_barang.dart';
import 'package:petaniku2/Barang/scroll_horizontal_barang.dart';
import 'package:petaniku2/Barang/slider_barang.dart';
import 'package:petaniku2/warna/warna.dart';

class test_asset_barang extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

final mediaquerywidth = MediaQuery.of(context).size.width;
final mediaqueryheigh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
               SizedBox(height: 190,),
              /* Container(
                color: warna.hijau,
                height: mediaqueryheigh*0.5,
                width: mediaquerywidth,
               // child: gridview_barang(),
               ),*/
              /*  Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ), 
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }
                    
                  ),
                )*/
              //gridview_barang()
             /* Container(
                //di container harus ada ukuran nya.di kelas ataupun saat pemanggilan harus di bungkus container
                height: mediaqueryheigh*0.2,
                width: mediaquerywidth,
                child: slider_barang()
                ),*/
              /*  Container(
                  child: button_kategori_barang(),
                )*/
              //berfungsi untuk mengatur lebar yang akan di tampilkan
            /*  Container(
               height: mediaqueryheigh*0.5,
               width: mediaquerywidth*1,
               decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                 color: warna.hijau
                ),
              /*gak ngaruh sama sekali
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
               ),*/
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: scroll_horizontal_barang(),
                ) ,
              ),*/
              SizedBox(height: 30,),
              
               
               /*  Container(
                  height: mediaqueryheigh*0.4,
                  width: mediaquerywidth*0.8,
                  child:GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 10,
          childAspectRatio: 265 / 150
        ),
       children: tombol,
      ),
    ) ,*/
              /*  Container(
                  height: 160,
                  width: 320,
                 color: Colors.amber,
                child: gridview_tombol_barang(),
                ),*/
               gridview_tombol_barang(),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}