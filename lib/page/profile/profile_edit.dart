import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:petaniku2/User/session_user.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class profile_edit extends StatefulWidget {
  const profile_edit({super.key});

  @override
  State<profile_edit> createState() => __profileSettingState();
}

class __profileSettingState extends State<profile_edit> {
  late String nama = '';
  late String email = '';
  late String username = '';
  late String alamat = '';
  late int idUser = 0;

  TextEditingController fieldUsername = TextEditingController();
  TextEditingController fieldNama = TextEditingController();
  TextEditingController fieldEmail = TextEditingController();
  TextEditingController fieldAlamat = TextEditingController();
  TextEditingController fieldId = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      nama = await PetanikuService.getUserData(PetanikuService.nama);
      email = await PetanikuService.getUserData(PetanikuService.email);
      username = await PetanikuService.getUserData(PetanikuService.username);
      alamat = await PetanikuService.getUserData(PetanikuService.alamat);

      fieldUsername.text = username;
      fieldNama.text = nama;
      fieldEmail.text = email;
      fieldAlamat.text = alamat;

      setState(() {});
    });
  }

  Future<void> updateUser({
    required String username,
    required String nama,
    required String email,
    required String alamat,
  }) async {
    final response = await http.post(
      PetaniKuConstant.baseUrl('updateuser'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'nama': nama,
        'email': email,
        'alamat': alamat,
      }),
    );

    if (response.statusCode == 200) {
      Get.showSnackbar(GetSnackBar(
        title: 'Success',
        message: 'Akun Berhasil Terupdate',
      ));

      await PetanikuService.setUserData(
          PetanikuService.username, fieldUsername.text);
      await PetanikuService.setUserData(PetanikuService.email, fieldEmail.text);
      await PetanikuService.setUserData(
          PetanikuService.alamat, fieldAlamat.text);
      await PetanikuService.setUserData(PetanikuService.nama, fieldNama.text);

      await Future.delayed(Duration(seconds: 2));

      Get.back();
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Akun Gagal Terupdate',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit akun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 143),
              child: Stack(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 54,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 80, top: 70),
                    child: IconButton(
                        iconSize: 35,
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo_outlined)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 65),
            //   child: Text(
            //     "Username",
            //     style: stylefont().Subheader,
            //   ),
            // ),
            // Container(
            //   width: 260,
            //   margin: EdgeInsets.only(left: 65),
            //   child: TextField(
            //     readOnly: true,
            //     controller: fieldUsername,
            //     decoration: InputDecoration(hintText: 'Masukan Username'),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text(
                "Nama",
                style: stylefont().Subheader,
              ),
            ),
            Container(
              width: 260,
              margin: EdgeInsets.only(left: 65),
              child: TextField(
                controller: fieldNama,
                decoration: InputDecoration(hintText: 'Masukan Nama'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text(
                "Email",
                style: stylefont().Subheader,
              ),
            ),
            Container(
              width: 260,
              margin: EdgeInsets.only(left: 65),
              child: TextField(
                controller: fieldEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Masukan Email'),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 65),
            //   child: Text(
            //     "Nomer",
            //     style: stylefont().Subheader,
            //   ),
            // ),
            // Container(
            //   width: 260,
            //   margin: EdgeInsets.only(left: 65),
            //   child: TextField(
            //     controller: fieldId,
            //     keyboardType: TextInputType.number,
            //     decoration: InputDecoration(hintText: 'Masukan Nomer'),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text(
                "Alamat",
                style: stylefont().Subheader,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              width: 290,
              child: TextField(
                controller: fieldAlamat,
                decoration: InputDecoration(
                  hintText: 'Masukan Alamat',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 50, bottom: 50),
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(300, 30)),
                      backgroundColor: MaterialStatePropertyAll(warna.hijau)),
                  onPressed: () async {
                    await updateUser(
                      username: username,
                      nama: fieldNama.text,
                      email: fieldEmail.text,
                      alamat: fieldAlamat.text,
                    );
                  },
                  child: Text(
                    "Simpan Perubahan",
                    style: stylefont().buton_kategori_barang,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
