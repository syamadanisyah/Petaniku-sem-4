import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class profile_edit extends StatefulWidget {
  const profile_edit({super.key});

  @override
  State<profile_edit> createState() => __profileSettingState();
}

class __profileSettingState extends State<profile_edit> {
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
            SizedBox(height: 60,),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text("Username",
              style: stylefont().Subheader,
              ),
            ),
            Container(
              width: 260,
              margin: EdgeInsets.only(left: 65),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Masukan Username'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text("Nama",
              style: stylefont().Subheader,
              ),
            ),
            Container(
              width: 260,
              margin: EdgeInsets.only(left: 65),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Masukan Nama'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text("Email",
              style: stylefont().Subheader,
              ),
            ),
            Container(
              width: 260,
              margin: EdgeInsets.only(left: 65),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Masukan Email'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text("Nomer",
              style: stylefont().Subheader,
              ),
            ),
            Container(
              width: 260,
              margin: EdgeInsets.only(left: 65),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukan Nomer'
                ),
              ),
            ),
             SizedBox(height: 20,),
               Container(
              margin: EdgeInsets.only(left: 65),
              child: Text("Alamat",
              style: stylefont().Subheader,
              ),
            ),
            Container(
               margin: EdgeInsets.only(left: 50),
              width: 290,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Masukan Alamat',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                borderRadius: BorderRadius.circular(10) ),
                ),
                ),
            ),
            SizedBox(height: 20,),
           Container(
             margin: EdgeInsets.only(left: 50,bottom: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(300, 30)),
                backgroundColor: MaterialStatePropertyAll(warna.hijau)
              ),
              onPressed: () {
              
            }, child: Text("Simpan Perubahan",style: stylefont().buton_kategori_barang,)
            ),
           ),
          ],
        ),
      ),
    );
  }
}
