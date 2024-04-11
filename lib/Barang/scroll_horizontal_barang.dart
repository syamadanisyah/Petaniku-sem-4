import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petaniku2/page/design_produk.dart';
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

  List<Map<String, dynamic>> listProduk = [];

  Future<void> showProduk() async {
    final response = await http
        .get(Uri.parse('http://192.168.18.11/flutterapi/petaniku/read.php'));
    if (response.statusCode == 200) {
      jsonProduk = response.body.toString();
      setState(() {
        listProduk = List<Map<String, dynamic>>.from(json.decode(jsonProduk));
        //ojo di kulinakne manual nek iso otomatis bang wkwkw siap :v
      });
      print("Contoh data = " + listProduk[0]['nama_produk']);
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
        return GestureDetector(
          onTap: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => 
            design_produk(dataProduk:listProduk[index],)
            ));
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
                    alignment: Alignment.center,
                    child: Text(""
                     //diem o
                     //fun mu rung mok panggil blok
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: listProduk[index]['nama_produk'].isEmpty
                        ? Text("Loading..")
                        : Text(
                            listProduk[index]['nama_produk'],
                            style: stylefont().body_gridview,
                          ),
                  ),//font mu kegeden oke wait
                  SizedBox(// seyk dilut
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: listProduk.isEmpty ? Text(
                      "Loading...",
                      style: stylefont().body_gridview,
                    ): Text(
                      listProduk[index]['harga'],
                      style: stylefont().body_gridview,
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
                  //dah brrti data mu kosong dan gaenek seng di load
                  Container(
                    alignment: Alignment.centerLeft,
                    child: listProduk.isEmpty? Text("Loading...",
                      style: stylefont().diskripsi_gridview_barang,
                      //btw dm kuning wes iso di tuker:v anjay aku ngincer skin bened :v
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ):Text(
                      listProduk[index]['diskripsi'],
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