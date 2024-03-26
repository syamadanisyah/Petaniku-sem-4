import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/Barang/gridview_barang.dart';
import 'package:petaniku2/Kategori/search_kategori.dart';
import 'package:petaniku2/warna/stylefont.dart';

class design_unit_kategori extends StatefulWidget {
  const design_unit_kategori({super.key});

  @override
  State<design_unit_kategori> createState() => _design_unit_kategoriState();
}

class _design_unit_kategoriState extends State<design_unit_kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: [
             Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              height: 60,
              child: Text("Cari produk sesuai keinginanmu",
              style: stylefont().Subheader,),
             ),
             Container(
              height: 50,
            //  color: Colors.amber,
              child: search_kategori(),
             ),
             Container(
              height: 40,
             ),
             Container(
              height: 700,
              padding: EdgeInsets.all(10),
           child: gridview_barang(),
             ),

            ],
            ) ,
            ),
      ),
    );
  }
}