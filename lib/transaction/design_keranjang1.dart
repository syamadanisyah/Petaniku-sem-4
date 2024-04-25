import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class design_keranjang extends StatefulWidget {
  const design_keranjang({super.key});

  @override
  State<design_keranjang> createState() => _design_keranjangState();
}

class _design_keranjangState extends State<design_keranjang> {

int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
title: Container(
  alignment: Alignment.center,
  child: Text("Keranjang",),
),
),

body: SingleChildScrollView(
  child: Column(
    children: [
      Container(
        height: 700,
        width: 480,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  splashRadius: 20,
                  activeColor: warna.hijau,
                  value: true, onChanged: (value) {
  
                },),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: warna.hijau,
                   height: 80,
                   width: 80,
                   alignment: Alignment.center,
                   child: Text("Gambar"),
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  children: [
                    Container(
                    alignment: Alignment.topCenter,
                      child: Text("Nama produk"),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.exposure_minus_1_outlined),),
  
                       Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: warna.abu_abu_putih,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)
                          ),
                        ),
                       ),
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.plus_one_outlined),),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },),
      )
    ],
  ),

),
bottomNavigationBar: Container(
  height: 60,
 color: warna.hijau,
  child: Row(
   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Text("Total Harga",
            style:stylefont().buton_kategori_barang ,),
            Text("Rp 300.000",
            style: stylefont().buton_kategori_barang,)
          ],
        ),
      ),
     Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 135),
      color: Colors.amber,
      height: 60,
      width: 150,
      child: Text("Bayar sekarang",
      style: TextStyle(),),
     )
    ],
  )
),

    );
  }
}