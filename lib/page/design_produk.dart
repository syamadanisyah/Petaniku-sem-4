import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/produk/box_diskripsi.dart';
import 'package:petaniku2/produk/design_button_fav.dart';
import 'package:petaniku2/produk/gambar_produk.dart';
import 'package:petaniku2/produk/modelProduk.dart';
import 'package:petaniku2/produk/scroll_horizontal_produk.dart';
import 'package:petaniku2/warna/navbar_produk_scroll_hide.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';


class design_produk extends StatelessWidget {
  final produk dataProduk;
  
  const design_produk({Key? key,
  required this.dataProduk
  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    return produk_dinamis(dataProduk: dataProduk,);
  }
}

class produk_dinamis extends StatefulWidget {

final produk dataProduk;

  const produk_dinamis({
    Key? key ,
    required this.dataProduk
  }):super(key: key);

  @override
  State<produk_dinamis> createState() => _produk_dinamisState(dataProduk: dataProduk);
}

class _produk_dinamisState extends State<produk_dinamis> {

final produk dataProduk;

_produk_dinamisState({
  required this.dataProduk
});



 late ScrollController controller;

@override
void initState(){
  super.initState();

  controller = ScrollController();
}

@override
void dispose(){
  controller = ScrollController();

  super.dispose();
}





  @override
  Widget build(BuildContext context) {

final mediaquerywidth = MediaQuery.of(context).size.width;
final mediaqueryheigh = MediaQuery.of(context).size.height;

    return Scaffold(
     body: SingleChildScrollView(
      controller: controller,
      child: Center(
          child: Column(
            children: [
              SizedBox(height: 400,),
             /*  Container(
                child: gambar_produk()
               ),*/
               SizedBox(height: 10,),
              Container(
                color: warna.hijau,
                height: 80,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7,),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(''
                          ,style: stylefont().body,)
                          ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Rp ${dataProduk.harga}',
                          style: stylefont().body,),
                        ),
                      ],
                    ),
                    SizedBox(width: 170,),
                   /* Container(

                      child: button_wishlist(),
                    ),*/
                  ],
                ),
              ),
        
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('',
                  textAlign:TextAlign.justify,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  style: stylefont().Subheader,),
                ),
                ),
               


              Container(
               //untuk memanggil scroll horizontal harus memberi nilai ukuran pada container jika tidak akan mengalami error rendering box

                 height: mediaqueryheigh*0.5,
                 width: mediaquerywidth*1,
                 decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                   color: warna.hijau
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: scroll_horizontal_produk(),
                  ) ,
                ),
        
            ],
          ),
        ), 
     ),


    bottomNavigationBar: ScrollToHideWidget(
      controller: controller,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: warna.hijau,
            width: 5,
            
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {
              
            }, child: Icon(Icons.shopping_cart,size: 35,color: Colors.amber[600],),
            style: ButtonStyle(
             minimumSize: MaterialStateProperty.all(Size(180, 35)),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(

              ),
             ),
            ),
            
            ),
           
     
            
           GestureDetector(
              onTap: () {
                
              },
             child: Container(
              height: 47,
              width: 200,
              alignment: Alignment.center,
              color: warna.hijau,
               child: Text("Pesan sekarang",
               style: stylefont().Subheader_navbar_produk,),
             ),
           ),
          ],
          ),
      ), 
    ),

    );
  }
}