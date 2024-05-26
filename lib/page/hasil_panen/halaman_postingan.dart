import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/page/hasil_panen/buat_postingan.dart';
import 'package:petaniku2/page/hasil_panen/modelHasilPanen.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class halaman_postingan extends StatefulWidget {
  const halaman_postingan({super.key});

  @override
  State<halaman_postingan> createState() => _halaman_postinganState();
}



class _halaman_postinganState extends State<halaman_postingan> {

    Future<List<modelHasilPanen>> fetchPosts() async {
    final response = await http.get(PetaniKuConstant.baseUrl('postingan'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> postsJson = data['data'];

      DMethod.log('data post : $postsJson');

      return postsJson.map((json) => modelHasilPanen.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late List<modelHasilPanen> hasilPanen = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async { 
      hasilPanen = await fetchPosts();
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text("Halaman Hasil Panen"),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: warna.hijau,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              onPressed: () {
                Get.to(
                buat_postingan()
                );
            }, child: Icon(Icons.upload_rounded,color: Colors.white,)
            ),
          ),
        ],
      ),
      body:Container(
        child: ListView.builder
        (itemCount: hasilPanen.length,
        scrollDirection: Axis.vertical,
          itemBuilder:(context, index) {
            var post = hasilPanen[index];
          return Container(
            height: null,
            width: 300,
            decoration: BoxDecoration(
              color: warna.abu_abu_hitam
            ),
            margin: EdgeInsets.only(top: 20,left: 20,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(post.nama,
                  style: stylefont().Subheader,
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  margin: EdgeInsets.only(left: 30,top: 10),
                  color: Colors.white,
                  child: Center(
                    child: Text("Gambar/foto"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Tanaman:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30,top: 3),
                  child: Text(post.tanaman,
                  style: TextStyle(
                    fontWeight: FontWeight.w500),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Luas Tanah:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30,top: 3),
                  child: Text('${post.luasTanah} x ${post.luasTanah}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Deskripsi hasil Panen:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30,top: 3,bottom: 20),
                  child: Text(post.deskripsiHasilPanen,
                  style: TextStyle(
                    fontWeight: FontWeight.w500),
                    maxLines: null,
                    ),
                ),
                
              ],
            ),
          ); 
        }, ),
      )

    );
  }
}