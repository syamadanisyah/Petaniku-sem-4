import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/User/session_user.dart';
import 'package:petaniku2/page/hasil_panen/modelHasilPanen.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class buat_postingan extends StatefulWidget {
  const buat_postingan({super.key});

  @override
  State<buat_postingan> createState() => _buat_postinganState();
}

class _buat_postinganState extends State<buat_postingan> {

  
  Future<void> addPost(modelHasilPanen post) async {
    final response = await http.post(
      PetaniKuConstant.baseUrl('addpost'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      _showErrorDialog(context, 'berhasil membuat pesanan');
    } else {
      _showErrorDialog(context, 'Gagal membuat pesanan');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  TextEditingController tanaman = TextEditingController();
  TextEditingController luas_tanah = TextEditingController();
  TextEditingController deskripsi_hasil_panen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Postingan"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 70),
            height: 150,
            width: 250,
            child: Center(
              child: Text("Gambar"),
            ),
            decoration: BoxDecoration(
                color: warna.abu_abu_hitam,
                borderRadius: BorderRadius.circular(8)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.red[800]),
                  onPressed: () {},
                  child: Icon(
                    Icons.image_not_supported_sharp,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        minimumSize: Size(60, 35),
                        backgroundColor: warna.hijau),
                    onPressed: () {},
                    child: Icon(
                      Icons.image_search,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Tanaman"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 290,
                  height: 40,
                  child: TextField(
                    controller: tanaman,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Luas Tanah"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 290,
                  height: 40,
                  child: TextField(
                    controller: luas_tanah,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Tuliskan Hasil panen ")),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 290,
                  height: 90,
                  child: TextField(
                    controller: deskripsi_hasil_panen,
                    maxLines: null,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: warna.hijau,
                            minimumSize: Size(300, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          var idUser = await PetanikuService.getUserData(
                              PetanikuService.userId);
                          var nama = await PetanikuService.getUserData(
                              PetanikuService.nama);

                          var posting = modelHasilPanen(
                            idUser: int.parse(idUser),
                            tanaman: tanaman.text,
                            nama: nama,
                            luasTanah: int.parse(luas_tanah.text),
                            deskripsiHasilPanen: deskripsi_hasil_panen.text,
                            gambar: '',
                          );

                          addPost(posting);
                        },
                        child: Text(
                          "Posting",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
