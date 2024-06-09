import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/transaction/statusBarang.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class keranjang_transactionState extends StatefulWidget {
  const keranjang_transactionState({
    super.key,
    required this.produk,
    required this.harga,
  });

  final List<modelProduk> produk;
  final int harga;

  @override
  State<keranjang_transactionState> createState() =>
      __keranjang_transactionStateState();
}

class __keranjang_transactionStateState
    extends State<keranjang_transactionState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          width: 400,
          child: 
          
          ListView.builder(
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: widget.produk.length,
            itemBuilder: (context, index) {
              var prod = widget.produk[index];


              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15),
                    height: 100,
                    width: 300,
                    // decoration: BoxDecoration(border: Border(top: BorderSide())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 100,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: warna.abu_abu_hitam),
                              child: CachedNetworkImage(imageUrl: prod.gambar ?? '', errorWidget: (context, url, error) {
                                return Text('gambar tidak tersedia');
                              },),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text(prod.nama)),
                            Row(
                              children: [
                                Text("Barang:"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("1")
                              ],
                            ),
                            Container(child: Text("Rp. ${prod.harga}")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border(top: BorderSide(width: 0))),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text("Sub total"),
                  //       SizedBox(width: 40),
                  //       Text("Rp "),
                  //       SizedBox(width: 20),
                  //     ],
                  //   ),
                  // )
                ],
              );


            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          color: warna.hijau,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    "Total Harga",
                    style: stylefont().buton_kategori_barang,
                  ),
                  Text(
                    "Rp. ${widget.harga}",
                    style: stylefont().buton_kategori_barang,
                  )
                ],
              ),
              InkWell(
                onTap: () async {
                  await kirimPesananSekarang(
                    idUser: 1,
                    totalHarga: widget.harga,
                    idProduk: widget.produk[0].id,
                    namaProduk: widget.produk[0].nama,
                    harga: widget.produk[0].harga,
                    jumlah: 1,
                  );
                },
                child: Container(
                  color: Colors.amber,
                  margin: EdgeInsets.only(left: 90),
                  height: 60,
                  width: 150,
                  child: Column(
                    children: [
                      Text("Pesan\nsekarang"),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> kirimPesananSekarang({
    required int idUser,
    required int totalHarga,
    required int idProduk,
    required String namaProduk,
    required int harga,
    required int jumlah,
  }) async {
    try {
      // Buat payload data dalam format JSON
      Map<String, dynamic> requestBody = {
        'id_user': idUser,
        'total_harga': totalHarga,
        'id_produk': idProduk,
        'nama_produk': namaProduk,
        'harga': harga,
        'jumlah': jumlah,
      };

      Get.dialog(
        const PopScope(
          canPop: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
        barrierDismissible: true,
        transitionCurve: Curves.easeOut,
      );

      // Kirim permintaan HTTP POST ke endpoint
      var response = await http.post(
        PetaniKuConstant.baseUrl("pesananbaru"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      Get.back();

      // Periksa kode status respons
      if (response.statusCode == 200) {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Informasi',
            message: 'Transaksi berhasil',
            duration: Duration(seconds: 3),
          ),
        );
        await Future.delayed(const Duration(seconds: 1));
        Get.off(tapBarStatus());
      } else {
        // Jika respons tidak berhasil, tampilkan pesan error
        Get.showSnackbar(
          GetSnackBar(
            title: 'Informasi',
            message: 'Gagal mengirim pesanan: ${response.statusCode}',
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      Get.back();
      // Tangkap dan tampilkan kesalahan jika terjadi
      Get.showSnackbar(
        GetSnackBar(
          title: 'Informasi',
          message: 'Error : ${e.toString()}',
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
