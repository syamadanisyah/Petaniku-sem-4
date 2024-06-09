import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/modelKategori.dart';
import 'package:petaniku2/page/design_unit_kategori_populer.dart';
import 'package:petaniku2/populer/model_populer.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;
import 'package:petaniku2/populer/model_populer.dart';

class gridview_tombol_barang extends StatefulWidget {
  @override
  State<gridview_tombol_barang> createState() => _gridview_tombol_barangState();
}

class _gridview_tombol_barangState extends State<gridview_tombol_barang> {
  
  List<kategoriPopuler> kategori = [];
  Future<List<kategoriPopuler>> fetchTopCategories() async {
    final response = await http.get(PetaniKuConstant.baseUrl("populer"));

    if (response.statusCode == 200) {
      List<kategoriPopuler> list =
          kategoriPopuler.kategoriFromJson(response.body);
      DMethod.log('length : ${list.length}');
      return list;
    } else {
      throw Exception('Failed to load top categories');
    }
  }

//   void loadData() async{

// kategori = await fetchTopCategories();
// setState(() {});

//   }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      kategori = await fetchTopCategories();
      setState(() {});
      
      
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [

              if(kategori.length >0)
              ElevatedButton(
                onPressed: () {
                  Get.to(design_unit_kategoriPopuler(
                    jeneng: kategori[0].nama,
                  ));
                },
                child: Container(
                  width: 90,
                  child: Column(
                    children: [
                      Text(
                        kategori[0].nama,
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 15),
                      Text(
                        '${kategori[0].totalProduk}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: warna.abu_abu_putih,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 7,
                    minimumSize: Size(70, 70)
                    ),
              ),



              SizedBox(
                width: 25,
              ),
               if(kategori.length >1)
              ElevatedButton(
                onPressed: () {
                       Get.to(design_unit_kategoriPopuler(
                    jeneng: kategori[1].nama,
                  ));
                },
                child: Container(
                  width: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        kategori[1].nama,
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${kategori[1].totalProduk}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: warna.abu_abu_putih,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 7,
                    minimumSize: Size(70, 70)),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),


          Row(
            children: [

               if(kategori.length >2)
              ElevatedButton(
                onPressed: () {
                       Get.to(design_unit_kategoriPopuler(
                    jeneng: kategori[2].nama,
                  ));
                },
                child: Container(
                  width: 90,
                  child: Column(
                    children: [
                      Text(
                        kategori[2].nama,
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${kategori[2].totalProduk}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: warna.abu_abu_putih,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 7,
                    minimumSize: Size(70, 70)),
              ),
              SizedBox(
                width: 25,
              ),

                if(kategori.length >3)
              ElevatedButton(
                onPressed: () {
                       Get.to(design_unit_kategoriPopuler(
                    jeneng: kategori[3].nama,
                  ));
                },
                child: Container(
                  width: 90,
                  child: Column(
                    children: [
                      Text(
                        kategori[3].nama,
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${kategori[3].totalProduk}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: warna.abu_abu_putih,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 7,
                    minimumSize: Size(70, 70)),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
