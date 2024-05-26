import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/page/design_proDet_kategori_populer.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class gridview_barang_populer extends StatefulWidget {
  const gridview_barang_populer({
    super.key,
    required this.jeneng,
  });

  final String jeneng;

  @override
  State<gridview_barang_populer> createState() =>
      _gridview_barang_populerState();
}

class _gridview_barang_populerState extends State<gridview_barang_populer> {
  late Future<List<modelProduk>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = selectCategory(widget.jeneng);
  }

  Future<List<modelProduk>> selectCategory(String name) async {
    final response = await http.get(
      PetaniKuConstant.baseUrl('select?name=${widget.jeneng}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      DMethod.log('response : $data');
      return modelProduk.fromJsonList(data['data']);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<modelProduk>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No products found');
          } else {
            final products = snapshot.data!;
            return GridView.builder(
              padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  childAspectRatio: 135 / 250),
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(design_proDet_kategori_populer(
                      modelPopuler: product ,
                    ));
                  },
                  child: itemGridPopuler(product: product),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class itemGridPopuler extends StatelessWidget {
  final modelProduk product;

  const itemGridPopuler({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: warna.warna_searching,
          borderRadius: BorderRadius.circular(10),
          border: Border.all()),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 140,
              width: 175,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: warna.hijau),
              child: Center(
                child: Text(
                  "Gambar",
                  style: stylefont().body_gridview,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                product.nama,
                style: stylefont().body_gridview,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Rp ${product.harga}",
                style: stylefont().diskripsi_gridview_barang,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
