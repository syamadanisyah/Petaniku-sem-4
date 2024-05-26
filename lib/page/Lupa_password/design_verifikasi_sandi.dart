import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/Lupa_Sandi/button_lp.dart';
import 'package:petaniku2/Lupa_Sandi/textfield_sandi_baru.dart';
import 'package:petaniku2/Lupa_Sandi/textfield_verifikasi_sandi.dart';
import 'package:http/http.dart' as http;
import 'package:petaniku2/page/design_login.dart';
import 'dart:convert';

import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/warna.dart';

class design_verifikasi_sandi extends StatefulWidget {
  @override
  State<design_verifikasi_sandi> createState() =>
      _design_verifikasi_sandiState();
  const design_verifikasi_sandi({
    super.key,
    required this.emai,
  });

  final String emai;
}

class _design_verifikasi_sandiState extends State<design_verifikasi_sandi> {
  TextEditingController sandiCont = TextEditingController();
  TextEditingController verifyCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(""),
          ),
          SizedBox(
            height: 230,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Masukan Sandi baru anda",
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(child: textfield_sandi_baru("", sandiCont)),
          SizedBox(
            height: 25,
          ),
          Container(child: textfield_verifikasi_sandi("", verifyCont)),
          SizedBox(
            height: 30,
          ),
          Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: warna.hijau,
                      minimumSize: Size(300, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                  onPressed: () async {
                    if (sandiCont.text == verifyCont.text) {
                      await changePassword(
                        context,
                        widget.emai,
                        sandiCont.text,
                      );
                    } else {
                      _showErrorDialog(context, 'Password Tidak Cocok');
                    }
                  },
                  child: Text(
                    'Lanjut',
                    style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    )),
                  )))
        ],
      ),
    );
  }

  Future<void> changePassword(
      BuildContext context, String email, String password) async {
    try {
      final response = await http.post(
        PetaniKuConstant.baseUrl('cp'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          await _showErrorDialog(context, 'Password Cocok', title: 'Berhasil');
          Get.to(
            design_login(),
            transition: Transition.rightToLeft,
          );
        } else {
          // Kesalahan dari server
          _showErrorDialog(context, responseData['message']);
        }
      } else {
        // Kesalahan HTTP
        _showErrorDialog(
            context, "Gagal mengubah password. Silakan coba lagi.");
      }
    } catch (error) {
      // Kesalahan jaringan atau lainnya
      _showErrorDialog(context, "Terjadi kesalahan. Silakan coba lagi.");
    }
  }

  Future<void> _showErrorDialog(BuildContext context, String message,
      {String title = 'Error'}) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
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
}
