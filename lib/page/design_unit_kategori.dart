import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/Barang/gridview_barang.dart';
import 'package:petaniku2/Kategori/listview_kategori.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/Kategori/search_kategori.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:http/http.dart' as http;
import 'package:d_method/d_method.dart';

class design_unit_kategori extends StatefulWidget {
  const design_unit_kategori({
    super.key,
    required this.kategori,
  });

  final modelKategori kategori;

  @override
  State<design_unit_kategori> createState() => _design_unit_kategoriState();
}

class _design_unit_kategoriState extends State<design_unit_kategori> {
  late List<modelProduk> listSearch = [];
  TextEditingController controller = TextEditingController();
  bool isSearching = false;

  // late List<modelProduk> listKategori = [];
  // Future<List<modelProduk>> getproduk() async {
  //   try {
  //     DMethod.log('load data');
  //     final response = await http.get(
  //       Uri.parse('http://192.168.18.11:8000/api/kategorifil?id_kategori=1'),
  //     );

  //     DMethod.log('after load data');
  //     if (response.statusCode == 200) {
  //       DMethod.log('response is 200');
  //       final List<dynamic> jsonResponse = jsonDecode(response.body);
  //       listKategori =
  //           jsonResponse.map((data) => modelProduk.fromJson(data)).toList();
  //       setState(() {});
  //     } else {
  //       DMethod.log('response is not 200');
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     DMethod.log('ERROR : ${e.toString()}');
  //     print('Error: $e');
  //   }

  //   for (var list in listKategori) {
  //     DMethod.log('product name: ${list.nama}');
  //   }

  //   return listKategori;
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('test aja bang'),
  //     ),
  //     body: FutureBuilder(
  //         future: getproduk(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return const Center(child: CircularProgressIndicator());
  //           }

  //           if (snapshot.hasError) {
  //             return Center(child: Text('ERROR : ${snapshot.error}'));
  //           }
  //           if (snapshot.hasData) {
  //             if (listKategori.isEmpty) {
  //               return Center(child: Text('data e kosong'));
  //             } else {
  //               return ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: listKategori.length,
  //                 itemBuilder: (context, index) {
  //                   var produk = listKategori[index];
  //                   return Text(produk.nama);
  //                 },
  //               );
  //             }
  //           }

  //           return const Center(
  //             child: Text('Ada Kesalahan'),
  //           );
  //         }),
  //   );
  // }

  late List<modelProduk> listKategori = [];

  Future<void> fetchData() async {
    try {
      DMethod.log('load data');
      final response = await http.get(
        PetaniKuConstant.baseUrl("kategorifil?id_kategori=${widget.kategori.id}"),
      );

      DMethod.log('after load data');
      if (response.statusCode == 200) {
        DMethod.log('response is 200');
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        listKategori =
            jsonResponse.map((data) => modelProduk.fromJson(data)).toList();
        setState(() {});
      } else {
        DMethod.log('response is not 200');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      DMethod.log('ERROR : ${e.toString()}');
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('test aja bang'),
      ),
      body: FutureBuilder(
        future: Future.value(listKategori),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('ERROR : ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            if (listKategori.isEmpty) {
              return Center(child: Text('data e kosong'));
            } else {
              return // return SingleChildScrollView(
                  SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      height: 60,
                      child: Text(
                        "Cari Produk sesuai keinginanmu",
                        style: stylefont().Subheader,
                      ),
                    ),
                    Container(
                      height: 50,
                      child: search_kategori(
                        controller: controller,
                        onSubmitted: (str) {
                          DMethod.log('on submitted search');
                          if (str.isNotEmpty && str.trim().isNotEmpty) {
                            isSearching = true;
                            setState(
                              () {
                                listSearch = listKategori
                                    .where((produk) => produk.nama
                                        .toLowerCase()
                                        .contains(
                                            controller.text.toLowerCase()))
                                    .toList();
                              },
                            );
                            for (var src in listSearch) {
                              print('search -> ${src.nama}');
                            }
                          } else {
                            listSearch = listKategori;
                            isSearching = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                    ),
                    Container(
                      height: 700,
                      padding: EdgeInsets.all(10),
                      child: gridview_barang(
                        listKategori: isSearching ? listSearch : listKategori,
                      ),
                    ),
                  ]),
                ),
              );
            }
          }

          return const Center(
            child: Text('Ada Kesalahan'),
          );
        },
      ),
    );
  }

  // return SingleChildScrollView(
  //   child: Center(
  //     child: Column(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(left: 15),
  //           alignment: Alignment.centerLeft,
  //           height: 60,
  //           child: Text(
  //             "Cari Produk sesuai keinginanmu",
  //             style: stylefont().Subheader,
  //           ),
  //         ),

  // Container(
  //   height: 50,
  //   child: search_kategori(
  //     controller: controller,
  //     onSubmitted: (str) {
  //       if (str.isNotEmpty && str.trim().isNotEmpty) {
  //         isSearching = true;
  //         setState(() {
  //           listSearch = listKategori
  //               .where((produk) => produk.nama
  //                   .toLowerCase()
  //                   .contains(controller.text.toLowerCase()))
  //               .toList();
  //         });
  //         for (var src in listSearch) {
  //           print('search -> ${src.nama}');
  //         }
  //       } else {
  //         listSearch = listKategori;
  //         isSearching = false;
  //         setState(() {});
  //       }
  //     },
  //   ),
  // ),
  // Container(
  //   height: 40,
  // ),
  // Container(
  //   height: 700,
  //   padding: EdgeInsets.all(10),
  //   child: gridview_barang(
  //     listKategori: isSearching ? listSearch : listKategori,
  //   ),
  // ),
  //       ],
  //     ),
  //   ),
  // );
  //     }
  //     return const Center(
  //       child: Text("Something Wrong"),
  //     );
  //   },
  // ));
  // }
}
