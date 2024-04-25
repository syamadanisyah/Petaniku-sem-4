import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/page/design_unit_kategori.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:http/http.dart' as http;


// class modelProduk {
//   final String id;
//   final String nama;
//   final String harga;
//   final int deskripsi;
//   final modelKategori kategori;

// const modelProduk({
// required this.id,
// required this.nama,
// required this.harga,
// required this.deskripsi,
// required this.kategori
// });

// factory modelProduk.fromJson(Map<String,dynamic>json){
//   return modelProduk(
//     id: json['id_produk'],
//    nama: json['nama_produk'],
//    harga: json['harga'],
//    deskripsi: json['diskripsi'],
//    kategori: modelKategori.fromJson(json['nama_kategori'])
   
//   );
// }

// }


// class modelKategori{

// final String id;
// final String namaKategori;

// const modelKategori({
// required this.id,
// required this.namaKategori
// });

// factory modelKategori.fromJson(Map<String,dynamic>json){
//   return modelKategori(
//     id: json['id_kategori'],
//      namaKategori: json['nama_kategori']
//      );
// }
// }

class listview_kategori extends StatefulWidget {
  const listview_kategori({super.key});

  @override
  State<listview_kategori> createState() => _listview_kategoriState();
}


class _listview_kategoriState extends State<listview_kategori> {

late List<modelProduk> listKategori = [];
 

  Future<void> showKategori() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.241.71/flutterapi/petaniku/kategori.php'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        // DMethod.log('$jsonData');

        listKategori = jsonData.map((data) {
          return modelProduk.fromJson(data);
        }).toList();

        // DMethod.log('length of list : ${listKategori.length}');

        for (var list in listKategori) {
          // DMethod.log('product name: ${list.nama}');
        }
      }
    } catch (ex) {
      // DMethod.log('EXCEPTION : ${ex.toString()}');
      //Fluttertoast.showToast(msg: ex.toString());
    }
  }

Future<List<modelProduk>> getProduk() async{
  await showKategori();
  return listKategori;
}

  // @override
  // void initState() {
  //   super.initState();
  //   showKategori();
  //   print(listKategori);
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:FutureBuilder<List<modelProduk>>(
      future: getProduk(),
      builder: (context, snapshot) {
         
 if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // jika data gagal diambil
          if(snapshot.hasError){
            return const Text('error saat mengambil data');
          }

         if(snapshot.hasData){
          return  ListView.builder( 
  itemCount: listKategori.length,
  itemBuilder: (BuildContext context, int index) {
   modelProduk pe = listKategori[index];
    return buildItemProduk(paino: pe,);
  },
);
         }
     return const Text("something wrong");
      },)
     
     
     
     
    
       
    );
  }
}

class buildItemProduk extends StatelessWidget {


  const buildItemProduk({
    super.key,
    required this.paino,
  });

  final modelProduk paino;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => design_unit_kategori(produk: paino, ),)
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350,
            margin: EdgeInsets.only(left: 20), 
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black),
              ),
            ),
            child: Row(
              children: [
                Text(
                  paino.kategori.namaKategori ??'',
                  style: stylefont().diskripsi_gridview_barang,
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          SizedBox(height: 15),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: oke.map((mantap) {
              return Container(child: Text(mantap));
            }).toList()
          ), */
        ],
      ),
    );
  }
}