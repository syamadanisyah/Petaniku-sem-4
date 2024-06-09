import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:d_method/d_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:petaniku2/User/session_user.dart';
import 'package:petaniku2/page/hasil_panen/halaman_postingan.dart';
import 'package:petaniku2/page/hasil_panen/modelHasilPanen.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import 'pilih gambar.dart';

class buat_postingan extends StatefulWidget {
  const buat_postingan({super.key});

  @override
  State<buat_postingan> createState() => _buat_postinganState();
}

class _buat_postinganState extends State<buat_postingan> {
  static Future<ChoosePhotoEntity?>? pickPhoto(ImageSource imageSource) async {
    // request permission
    Map<Permission, PermissionStatus> status = await [
      Permission.storage,
      Permission.camera,
    ].request();

    // cek permission
    if (status[Permission.storage]!.isGranted ||
        status[Permission.camera]!.isGranted) {
      // choose photo
      final returnImage = await ImagePicker().pickImage(
        source: imageSource,
      );

      // get photo
      DMethod.log('from photo');
      if (returnImage != null) {
        return ChoosePhotoEntity(
          image: File(returnImage.path).readAsBytesSync(),
          imageSelected: File(
            returnImage.path,
          ),
        );
      } else {
        return null;
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Warning',
        message: 'Permission dibutuhkan',
      ));
    }
    return null;
  }

  // Future<void> addPostOld(modelHasilPanen post) async {
  //   final response = await http.post(
  //     PetaniKuConstant.baseUrl('addpost'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(post.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  // Map<String, dynamic> responseData = jsonDecode(response.body);
  // _showErrorDialog(context, 'berhasil membuat postingan');
  // Get.off(halaman_postingan());
  //   } else {
  //     _showErrorDialog(context, 'Gagal membuat postingan');
  //   }
  // }

  Future<void> addPost(modelHasilPanen postData, BuildContext context) async {
    var uri = PetaniKuConstant.baseUrl('addpost');
    var request = http.MultipartRequest('POST', uri);

    // dynamic iduser =  await PetanikuService.getUserId();
    // DMethod.log('id use ');

    // Adding text fields
    request.fields['id_user'] = '1';
    request.fields['nama'] = postData.nama;
    request.fields['tanaman'] = postData.tanaman;
    request.fields['tanah'] = postData.luasTanah.toString();
    request.fields['hasil'] = postData.deskripsiHasilPanen;

    DMethod.log('path : ${photoEntity.imageSelected!.path}');

    // Adding the image file
    var mimeType = lookupMimeType(photoEntity.imageSelected!.path);
    var fileType = mimeType!.split('/');

    request.files.add(
      await http.MultipartFile.fromPath(
        'photo',
        photoEntity.imageSelected!.path,
        contentType: MediaType(fileType[0], fileType[1]),
      ),
    );

    // Sending the request
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        _showErrorDialog(context, 'berhasil membuat postingan');
        Get.off(halaman_postingan());
      } else {
        _showErrorDialog(
            context, 'Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog(context, 'Error uploading post: $e');
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

  late ChoosePhotoEntity photoEntity =
      ChoosePhotoEntity(image: null, imageSelected: null);

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
            child: photoEntity.imageSelected != null
                ? Image.file(
                    photoEntity.imageSelected!,
                    fit: BoxFit.cover,
                  )
                : Center(child: Text('Silahkan pilih gambar')),
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
                  onPressed: () {
                    photoEntity =
                        ChoosePhotoEntity(image: null, imageSelected: null);
                    setState(() {});
                  },
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
                    onPressed: () async {
                      photoEntity = await pickPhoto(ImageSource.gallery)
                          as ChoosePhotoEntity;
                      setState(() {});
                    },
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

                          addPost(posting, context);
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
