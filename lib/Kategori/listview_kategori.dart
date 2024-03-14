import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/warna/stylefont.dart';

class listview_kategori extends StatefulWidget {
  const listview_kategori({super.key});

  @override
  State<listview_kategori> createState() => _listview_kategoriState();
}

class _listview_kategoriState extends State<listview_kategori> {

final List<Widget> ini = [];


final List<Map<String,dynamic>> data_produk = [
     {
    "produk":"pupuk penyubur",
    "sembarang": ["aku","dan","hafida"]
     },
     {
    "produk":"obat pestisida",
    "sembarang": ["aku","dan","hafida"]
     },
     {
    "produk":"pupuk pengganda gem",
    "sembarang": ["aku","dan","hafida"]
     },
     {
    "produk":"pupuk obat pemercepat eleksir",
    "sembarang": ["aku","dan","hafida"]
     },
     {
    "produk":"pupuk kompos",
    "sembarang": ["aku","dan","hafida"]
     }
]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView(
      children: data_produk.map((e) {
        List oke = e['sembarang'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350,
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Expanded(child: Text("${e['produk']}",
                  
                  style: stylefont().diskripsi_gridview_barang,),
                   ),
                 Icon(Icons.arrow_forward_ios)
                ],
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black,),
                ),
              ),
              
            ),
            SizedBox(height: 15,)
     
         /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:oke.map((mantap) {
            return Container(child: Text(mantap));
            }).toList()
          ),*/
          ],
        );
      }).toList(),
     )
       
    );
  }
}