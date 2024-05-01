import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/page/design_unit_kategori.dart';
import 'package:petaniku2/produk/modelProduk.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:http/http.dart' as http;
import 'package:d_method/d_method.dart';

class listview_kategori extends StatefulWidget {
  const listview_kategori({super.key});

  static String Kategori = "";
  static String Id_kategori = "";

  @override
  State<listview_kategori> createState() => _listview_kategoriState();
}

class _listview_kategoriState extends State<listview_kategori> {
  String jsonKategori = "{}";
  String jsonId_kategori = "{}";
  late List<modelKategori> listKategori = [];

  Future<void> showKategori() async {
    try {
      final response = await http.get(PetaniKuConstant.baseUrl("kategori"));

      DMethod.log('call kategory --> ${response.statusCode}');

      if (response.statusCode == 200) {
        var body = response.body;

        DMethod.log('body : $body');

        List<dynamic> jsonDataList = json.decode(body);

        // Sekarang, kita gunakan modelKategori.fromList untuk mengonversi JSON List menjadi List<modelKategori>
        List<modelKategori> kategoriList = modelKategori.fromList(jsonDataList);

        listKategori = kategoriList;
        setState(() {});

        // KategoriList sekarang berisi daftar modelKategori yang dihasilkan dari data JSON yang diterima dari API
      } else {
        DMethod.log('code is not 200');
      }
    } catch (ex) {
      DMethod.log('EXCEPTION : ${ex.toString()}');
      //Fluttertoast.showToast(msg: ex.toString());
    }
  }

  @override
  void initState() {
    super.initState();
     showKategori();
  }

  // Future<List<modelKategori>> getProduk() async {
  //   await showKategori();
  //   return listKategori;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   showKategori();
  //   print(listKategori);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<modelKategori>>(
      future: Future.value(listKategori),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // jika data gagal diambil
        if (snapshot.hasError) {
          return const Text('error saat mengambil data');
        }

        if (snapshot.hasData) {
          var listData = snapshot.data as List<modelKategori>;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              // return Text(listData[index].namaKategori);
              return buildItemProduk(
                paino: listData[index],
              );
            },
          );
        }
        return const Text("something wrong");
      },
    ));
  }
}

class buildItemProduk extends StatelessWidget {
  const buildItemProduk({
    super.key,
    required this.paino,
  });

  final modelKategori paino;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // listview_kategori.Kategori = paino.toString();
        // print(paino.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => design_unit_kategori(
                kategori: paino,
              ),
            ));
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
                  // paino.m,
                  paino.namaKategori ?? 'null',
                  // paino.namaKategori
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
