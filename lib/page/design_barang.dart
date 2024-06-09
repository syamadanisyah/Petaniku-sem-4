import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Barang/button_kategori_barang.dart';
import 'package:petaniku2/Barang/slider_barang.dart';
import 'package:petaniku2/transaction/design_keranjang_transaction.dart';
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
      // appBar: AppBar(
      //   actions: [

      //     Container(
      //       margin: EdgeInsets.only(right: 20),
      //       child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               backgroundColor: warna.hijau,
      //               minimumSize: Size(40, 30),
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(8))),
      //           onPressed: () {

      //       Get.to(
      //         keranjang_transactionState(produk: produk, harga: 222)
      //       )

      //           },
      //           child: Icon(Icons.shopping_cart_rounded, color: Colors.white)),
      //     ),
      //   ],
      // ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
           
                  Container(
                    margin: EdgeInsets.only(right: 150),
                    child: Text(
                      "Produk tani",
                      style: stylefont().Header,
                    ),
                  ),
                  
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: warna.hijau,
                            minimumSize: Size(40, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {

                          //

                          Get.to(
                            keranjang_transactionState(produk: [], harga: 222)
                          );
                        },
                        child: Icon(Icons.shopping_cart_rounded,
                            color: Colors.white)),
                  ),
                ],
              ),
              // Container(
              //     //di container harus ada ukuran nya.di kelas ataupun saat pemanggilan harus di bungkus container
              //     height: mediaqueryheigh * 0.2,
              //     width: mediaquerywidth,
              //     child: slider_barang()
              //     ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: button_kategori_barang(),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  "kategori Terpopuler",
                  style: stylefont().Subheader,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.amber,
                alignment: Alignment.center,
                height: 160,
                width: 320,
                //color: Colors.amber,
                child: gridview_tombol_barang(),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: mediaqueryheigh * 0.5,
                width: mediaquerywidth * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: warna.hijau),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: scroll_horizontal_barang(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: mediaqueryheigh * 0.5,
                width: mediaquerywidth * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: warna.hijau),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: scroll_horizontal_barang(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
