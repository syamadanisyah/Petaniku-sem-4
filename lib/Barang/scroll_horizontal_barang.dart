import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/page/design_produk.dart';
import 'package:petaniku2/produk/modelProduk.dart';
import 'package:petaniku2/transaction/design_keranjang1.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class scroll_horizontal_barang extends StatefulWidget {
  const scroll_horizontal_barang({super.key});

  @override
  State<scroll_horizontal_barang> createState() =>
      _scroll_horizontal_barangState();
}

class _scroll_horizontal_barangState extends State<scroll_horizontal_barang> {
  @override
  Widget build(BuildContext context) {
    return dinamis_horizontal();
  }
}

class dinamis_horizontal extends StatefulWidget {
  const dinamis_horizontal({
    super.key,
  });

  @override
  State<dinamis_horizontal> createState() => _dinamis_horizontalState();
}

class _dinamis_horizontalState extends State<dinamis_horizontal> {
  String jsonProduk = "{}";

  List<modelProduk> listProduk = [];

  Future<void> showProduk() async {
    print('show produk');
     
     try {
       
       final response = await http
        .get(PetaniKuConstant.baseUrl('produk'));
    if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
           
           setState(() {
             listProduk = jsonData.map((data) =>
              modelProduk.fromJson(data)).toList();
           });
     // print("Contoh data = " + listProduk[0]['nama_produk']);
    }else{
      throw Exception('failed to load data : ${response.statusCode}');
    }



     } catch (error) {
       print('Error:$error');
     }


 
  }

@override
  void initState() {
    super.initState();
    showProduk();
    setState(() {
    showProduk();
      print("contoh = test print");
      //ki bener class e ga? bener i scroll horizontal mau ae tulisanne berubah dadi loading_- print e ae ga ke panggil , harus e masio data ne kosong print e ttep kepanggil di run ulang biasane kenek :) panggah opo goro goro firebase ya?
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaquerywidth = MediaQuery.of(context).size.width;

    return ListView.separated(
      separatorBuilder: (context, index) {
        //layout dasar
        return Container(
          width: 13,
          height: MediaqueryHeight,
        );
      },
      itemCount: listProduk.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final modelProduk prd = listProduk[index]; 
        return InkWell(
         onTap: () {
           Get.to(
            design_produk(dataProduk: prd)
           );
          },
          
          child: Container(
            //layout untuk penampilan
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 206, 203, 203),
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * 0.5,
            //kiro kiro knpo bang?
          
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: warna.abu_abu_hitam),
                    child: CachedNetworkImage(
                        imageUrl: prd.gambar ?? '',
                        placeholder: (context, url) {
                          return Center(
                            child: Text('gambar tidak tersedia'),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Text('gambar tidak tersedia'),
                          );
                        },
                        fit: BoxFit.cover,
                      )
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                   child: prd.nama.toString().isEmpty
                        ? Text("Loading..")
                        : Text(
                            prd.nama.toString(),
                            
                            style: stylefont().body_gridview,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),//font mu kegeden oke wait
                  SizedBox(// seyk dilut
                    height: 10,
                  ),
                   

                  Container(
                    alignment: Alignment.centerLeft,
                    child: prd.harga ==0? Text(
                      "Loading...",
                      style: stylefont().body_gridview,
                    ): Text(
                      'Rp ${prd.harga}',
                      style: stylefont().body_gridview,
                    ),
                  ),
                  SizedBox(
                    height:20,
                  ),
                  //dah brrti data mu kosong dan gaenek seng di load
                  Container(
                    alignment: Alignment.centerLeft,
                   child: prd.deskripsi.toString().isEmpty
                   ?Text("Loading...",
                     style: stylefont().diskripsi_gridview_barang,
                      //btw dm kuning wes iso di tuker:v anjay aku ngincer skin bened :v
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      )
                    :Text(
                     prd.deskripsi.toString(),
                      style: stylefont().diskripsi_gridview_barang,
                       maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
//iku error soal e data ne kosong dadi kudu enek pengHandle error e