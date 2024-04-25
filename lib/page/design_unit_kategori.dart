import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/Barang/gridview_barang.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/Kategori/search_kategori.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:http/http.dart' as http;

class design_unit_kategori extends StatefulWidget {

const design_unit_kategori({
super.key,
required this.produk

});
final modelProduk produk;


  @override
  State<design_unit_kategori> createState() => _design_unit_kategoriState();
  
  }

class _design_unit_kategoriState extends State<design_unit_kategori> {

  late List<modelProduk> listKategori = [];
  late List<modelProduk> listSearch = [];
   TextEditingController controller = TextEditingController();
  bool isSearching = false;

Future<void>showKategori()async{
try {
  
 final response = await http.get(
        Uri.parse(
            'http://192.168.241.71/flutterapi/petaniku/produk_by_kategori.php?id_kategori=${widget.produk.kategori.id}'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        // DMethod.log('JSON DATA : $jsonData');

        listKategori = jsonData.map((data) {
          return modelProduk.fromJson(data);
        }).toList();

        for (var list in listKategori) {
          // DMethod.log('product name: ${list.nama}');
        }
      }


} catch (e) {
    // DMethod.log('EXCEPTION : ${ex.toString()}');
      // Fluttertoast.showToast(msg: ex.toString());

   }
}

Future<List<modelProduk>> getproduk() async {
await showKategori();
return listKategori;
}


@override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      showKategori();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
  future: getproduk(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (snapshot.hasError) {
      return Text("Error saat mengambil data");
    }
    if (snapshot.hasData) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                    if (str.isNotEmpty && str.trim().isNotEmpty) {
                      isSearching = true;
                      setState(() {
                        listSearch = listKategori
                            .where((produk) => produk.nama
                                .toLowerCase()
                                .contains(controller.text
                                .toLowerCase()))
                            .toList();
                      });
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
            ],
          ),
        ),
      );
    }
    return const Center(child: Text("Something Wrong"),); // Return statement tambahan untuk kasus default
  },
)

    );
    
  
  }
}