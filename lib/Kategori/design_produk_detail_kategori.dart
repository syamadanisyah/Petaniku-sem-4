import 'package:flutter/material.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/produk/scroll_horizontal_produk.dart';
import 'package:petaniku2/warna/navbar_produk_scroll_hide.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:petaniku2/warna/stylefont.dart';

class design_produk_detail_kategori extends StatelessWidget {
  final Map<String,dynamic> dataProdukByKategori;
  
  const design_produk_detail_kategori({Key? key,
  required this.dataProdukByKategori
  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    return produk_detail_kategori_dinamis(dataProdukByKategori_dinamis: dataProdukByKategori,);
  }
}

class produk_detail_kategori_dinamis extends StatefulWidget {
final Map<String,dynamic> dataProdukByKategori_dinamis;

const produk_detail_kategori_dinamis({
  Key?key,
  required this.dataProdukByKategori_dinamis
}):super(key: key);

// final Map<String,dynamic>dataProduk;

//   const produk_detail_kategori_dinamis({
//     Key? key ,
//     required this.dataProduk
//   }):super(key: key);

  @override
  State<produk_detail_kategori_dinamis> createState() => _produk_dinamisState(ambilData: dataProdukByKategori_dinamis);
}

class _produk_dinamisState extends State<produk_detail_kategori_dinamis> {
final Map<String,dynamic> ambilData ;
_produk_dinamisState({
  required this.ambilData
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
                          child: Text(ambilData['nama'],
                          style: stylefont().body,)
                          ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(ambilData['harga'],
                          style: stylefont().body,),
                        ),
                      ],
                    ),
                    SizedBox(width: 170,),
                  ],
                ),
              ),
        
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(ambilData['deskripsi'],
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
