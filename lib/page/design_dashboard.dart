import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Dashboard/button_barang_dashboard.dart';
import 'package:petaniku2/Dashboard/button_from_bantuan_dashboard.dart';
import 'package:petaniku2/Dashboard/button_from_hasil_panen_dashboard.dart';
import 'package:petaniku2/Dashboard/data_graphik.dart';
import 'package:petaniku2/Dashboard/textfield_searching_dashboard.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/page/design_produk.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class design_dashboard extends StatefulWidget {
  @override
  State<design_dashboard> createState() => _design_dashboardState();
}

class _design_dashboardState extends State<design_dashboard> {
  Future<modelProduk> fetchPopularProduct() async {
    final response = await http.get(
      PetaniKuConstant.baseUrl('populer2'),
    );

    if (response.statusCode == 200) {
      // Decode the response body to a Map<String, dynamic>
      final jsonResponse = jsonDecode(response.body);

      // Extract 'data' field from the response
      final productData = jsonResponse['data'];

      DMethod.log('json : $productData');

      // Pass the product data to the fromJson method
      return modelProduk.fromJson(productData);
    } else {
      throw Exception('Failed to load popular product');
    }
  }

  late modelProduk pop = modelProduk(
    id: 1,
    nama: 'null',
    harga: 0,
    deskripsi: 'null',
    gambar: ''
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      pop = await fetchPopularProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dashboard",
                  style: GoogleFonts.urbanist(
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              // textfield_searching(),
              //  Container(
              //   margin: EdgeInsets.only(left: 30),
              //   alignment: Alignment.centerLeft,
              //   child: Text("Menu",style: GoogleFonts.urbanist(
              //     textStyle:TextStyle(fontSize:25 ,
              //     fontWeight: FontWeight.w600) ),
              //     ),
              // ),
              SizedBox(
                height: 10,
              ),
              button_barang_dashboard(),
              SizedBox(
                height: 10,
              ),
              button_halaman_hasil_panen(),
              SizedBox(
                height: 10,
              ),
              // button_halaman_bantuan_dashboard(),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Informasi hasil panen",
                  style: GoogleFonts.urbanist(
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  // color: warna.hijau,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.transparent),
                ),
                child: lineChart(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Produk paling populer",
                  style: GoogleFonts.urbanist(
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(design_produk(dataProduk: dataProduk))
                },
                child: Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                      color: warna.hijau,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.transparent)),
                  child: CachedNetworkImage(
                    imageUrl:  'https://petaniku.tifnganjuk.com/uploads/17179356509.jpeg',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Text('Gambar tidak tersedia'),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //  Container(

              //   width: 350,
              //   height: 180,
              //   decoration: BoxDecoration(
              //     color: warna.hijau,
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(
              //       color: Colors.transparent
              //     )
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
