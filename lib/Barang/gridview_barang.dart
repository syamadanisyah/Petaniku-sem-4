import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

class gridview_barang extends StatefulWidget {
  
  @override
  State<gridview_barang> createState() => _gridview_barangState();
}

class _gridview_barangState extends State<gridview_barang> {
List _produk=[];

Future _ambilData() async {
  try {
    final response = await http.get(Uri.parse('http://localhost/flutterapi/petaniku/read.php')
    );

   if(response.statusCode==200){
    print(response.body);
    final data = jsonDecode(response.body);
    setState(() {
      _produk=data;
    });
   }

  } catch (e) {
    print(e);
  }
}

@override
  void initState() {
    _ambilData();
    
    // TODO: implement initState
    super.initState();
  }


@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 12,
              childAspectRatio: 135 / 250, // Adjust the aspect ratio
            ),
            itemCount: 6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: warna.warna_searching,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: warna.hijau,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Text("Nama produk",style: stylefont().body_gridview),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:5 ),
                        alignment: Alignment.centerLeft,
                        child: Text("Rp 56.000",style: stylefont().body_gridview,),
                        ),
                        
                        SizedBox(height: 70,),
                         Container(
                          margin: EdgeInsets.only(left:5 ),
                        alignment: Alignment.centerLeft,
                        child: Text("diskripsi",style:  stylefont().diskripsi_gridview_barang,),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
}




  
   
