import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class keranjang_transactionState extends StatefulWidget {
  const keranjang_transactionState({super.key});

  @override
  State<keranjang_transactionState> createState() => __keranjang_transactionStateState();
}

class __keranjang_transactionStateState extends State<keranjang_transactionState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          width: 400,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
           // physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10,left: 15),
                height: 100,
                width: 300,
                           // decoration: BoxDecoration(border: Border(top: BorderSide())),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                     margin: EdgeInsets.only(top: 10),
                      width: 100,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: warna.abu_abu_hitam
                        ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Nama barang")
                          ),
                          Row(
                            children: [
                              Text("Barang:"),
                              SizedBox(width: 10,),
                              Text("2")
                            ],
                          ),
                        Container(
                          child: Text("Rp 100.000")
                          ),
                
                        
                      ],
                
                    ),
                  ],
                ),
                ),
                  Container(
                            decoration: BoxDecoration(border: Border(top: BorderSide(width: 0))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Sub total"),
                                SizedBox(width: 40),
                                Text("Rp 200.000"),
                                SizedBox(width: 40),
                              ],
                            ),
                          )
              ],
            );
          },),
        ),
        
      ),
      bottomNavigationBar: Container(
  height: 60,
color: warna.hijau,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        children: [
          Text("Total Harga",
          style: stylefont().buton_kategori_barang,),
          Text("Rp 300.000",
          style: stylefont().buton_kategori_barang,)
        ],
      ),
      Container(
        color: Colors.amber,
        margin: EdgeInsets.only(left:135 ),
        height: 60,
        width: 150,
        child: Column(
          children: [
            Text("Pesan"),
            Text("Sekarang"),
          ],
        ),
      )
    ],
  )
),
    );
  }
}