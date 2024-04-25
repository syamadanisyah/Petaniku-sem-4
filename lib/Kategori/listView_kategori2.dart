// import 'dart:convert';
// // import 'package:d_method/d_method.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:pasaraja_mobile/config/themes/Typography.dart';

// // import 'package:petaniku2/warna/stylefont.dart';
// import 'package:http/http.dart' as http;
// import 'package:pasaraja_mobile/syam_detail.dart';
// import 'package:pasaraja_mobile/syam_model_produk.dart';

// class listview_kategori extends StatefulWidget {
//   const listview_kategori({super.key});

//   @override
//   State<listview_kategori> createState() => _listview_kategoriState();
// }

// class _listview_kategoriState extends State<listview_kategori> {
//   late List<modelProduk> listKategori = [];

//   Future<void> showKategori() async {
//     try {
//       final response = await http.get(
//         Uri.parse('http://192.168.170.152/flutterapi/petaniku/kategori.php'),
//       );

//       if (response.statusCode == 200) {
//         List<dynamic> jsonData = json.decode(response.body);
//         // DMethod.log('$jsonData');

//         listKategori = jsonData.map((data) {
//           return modelProduk.fromJson(data);
//         }).toList();

//         // DMethod.log('length of list : ${listKategori.length}');

//         for (var list in listKategori) {
//           // DMethod.log('product name: ${list.nama}');
//         }
//       }
//     } catch (ex) {
//       // DMethod.log('EXCEPTION : ${ex.toString()}');
//       // Fluttertoast.showToast(msg: ex.toString());
//     }
//   }

//   Future<List<modelProduk>> getProducts() async {
//     await showKategori();
//     return listKategori;
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   showKategori();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: FutureBuilder<List<modelProduk>>(
//         future: getProducts(),
//         builder: (context, snapshot) {
//           // dalam loading
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CupertinoActivityIndicator());
//           }

//           // jika data gagal diambil
//           if (snapshot.hasError) {
//             return const Text('error saat mengambil data');
//           }

//           // jika data sukses diambil
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: listKategori.length,
//               itemBuilder: (BuildContext context, int index) {
//                 modelProduk paino = listKategori[index];
//                 return _buildItemProduk(paino: paino);
//               },
//             );
//           }
//           return const Text('Something Wrong');
//         },
//       ),
//     );
//   }
// }

// class _buildItemProduk extends StatelessWidget {
//   const _buildItemProduk({
//     super.key,
//     required this.paino,
//   });

//   final modelProduk paino;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // DMethod.log('on tap');
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => design_unit_kategori(produk: paino),
//           ),
//         );
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 350,
//             margin: const EdgeInsets.only(left: 20),
//             decoration: const BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(color: Colors.black),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   paino.kategori.namaKategori ?? '',
//                   // style: stylefont().diskripsi_gridview_barang,
//                   style: PasarAjaTypography.sfpdRegular,
//                 ),
//                 const Icon(Icons.arrow_forward_ios)
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           /* Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: oke.map((mantap) {
//                     return Container(child: Text(mantap));
//                   }).toList()
//                 ), */
//         ],
//       ),
//     );
//   }
// }