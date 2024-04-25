import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:petaniku2/Kategori/design_produk_detail_kategori.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class gridview_barang extends StatefulWidget {

 late List<modelProduk> listKategori = [];

 gridview_barang({
Key? key,
required this.listKategori

}):super(key: key);


  @override
  State<gridview_barang> createState() => _gridview_barangState();
}

class _gridview_barangState extends State<gridview_barang> {


@override
  void initState() {
    super.initState();

  }


@override
Widget build(BuildContext context) {
  return Center(
    child: Column(
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 12,
            childAspectRatio: 135 / 250, // Adjust the aspect ratio
          ),
          itemCount: widget.listKategori.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final modelProduk = widget.listKategori[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => design_produk_detail_kategori(
                  dataProdukByKategori:{
                    'nama':modelProduk.nama,
                    'harga':modelProduk.harga,
                    'deskripsi':modelProduk.deskripsi
                  } ),
                  ));
              },
              child: itemGrid(
                produk: modelProduk,
              ),
            );
          },
        ),
      ],
    ),
  );
}
}

class itemGrid extends StatelessWidget {
  const itemGrid({
    super.key,
    required this.produk
  });

final modelProduk produk;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: warna.warna_searching,
        borderRadius: BorderRadius.circular(10),
        border: Border.all()
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              height: 140,
              width: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: warna.hijau,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(produk.nama,
              style: stylefont().body_gridview),
              ),
              Container(
                margin: EdgeInsets.only(left:5 ),
              alignment: Alignment.centerLeft,
              child: Text(produk.harga,
              style: stylefont().body_gridview,),
              ),
              
              SizedBox(height: 70,),
               Container(
                margin: EdgeInsets.only(left:5 ),
              alignment: Alignment.centerLeft,
              child: Text(produk.deskripsi,
              style:  stylefont().diskripsi_gridview_barang,
              maxLines: 2,),
              ),
          ],
        ),
      ),
    );
  }
}




  
   
