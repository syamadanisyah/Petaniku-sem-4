import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/produk/box_diskripsi.dart';
import 'package:petaniku2/produk/design_button_fav.dart';
import 'package:petaniku2/produk/gambar_produk.dart';
import 'package:petaniku2/produk/modelProduk.dart';
import 'package:petaniku2/produk/scroll_horizontal_produk.dart';
import 'package:petaniku2/transaction/cart_controller.dart';
import 'package:petaniku2/transaction/design_keranjang1.dart';
import 'package:petaniku2/transaction/design_keranjang_transaction.dart';
import 'package:petaniku2/warna/navbar_produk_scroll_hide.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';


class design_produk extends StatelessWidget {
  final modelProduk dataProduk;
  
  const design_produk({Key? key,
  required this.dataProduk
  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    return produk_dinamis(dataProduk: dataProduk,);
  }
}

class produk_dinamis extends StatefulWidget {

final modelProduk dataProduk;

  const produk_dinamis({
    Key? key ,
    required this.dataProduk
  }):super(key: key);

  @override
  State<produk_dinamis> createState() => _produk_dinamisState(dataProduk: dataProduk);
}

class _produk_dinamisState extends State<produk_dinamis> {

final modelProduk dataProduk;

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
                alignment: Alignment.centerLeft,
                color: warna.hijau,
                height: 80,
                
                
               
                  child:   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 7,),
                        Container(
                          // width: 400,
                          margin: EdgeInsets.only(left: 5),
                          child: Text(dataProduk.nama
                          ,style: stylefont().body,
                          )
                          ),
                        Container(
                          // width: 400,
                          margin: EdgeInsets.only(left: 5),
                          child: Text('Rp ${dataProduk.harga}',
                          style: stylefont().body,),
                        ),
                      ],
                    ),
                    // SizedBox(width: 170,),
                   /* Container(

                      child: button_wishlist(),
                    ),*/
                  
              ),
        
              Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(dataProduk.deskripsi.toString(),
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
            ElevatedButton(onPressed: () async {
              DMethod.log('id produk : ${widget.dataProduk.id}');
              DMethod.log('nama produk : ${widget.dataProduk.nama}');
              
              int qty = await showQtyDialog(context,1) ?? 1;

              if(qty <= 0){
                qty = 1;
              }

              DMethod.log('qty : $qty');
              final controller = CartController();
               //dari sini kemarin
              await controller.addCart(
                1, widget.dataProduk.id
                , widget.dataProduk.nama!, 
                qty,
                widget.dataProduk.harga.toString()
                );
              Get.to(design_keranjang()
              );
            },
             child: Icon(Icons.shopping_cart,size: 35,color: Colors.amber[600],),
            style: ButtonStyle(
             minimumSize: MaterialStateProperty.all(Size(180, 35)),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(

              ),
             ),
            ),
            
            ),
     
            
           GestureDetector(
              onTap: () async {
                List<modelProduk> models = [widget.dataProduk];
                int totalPrice = 0;
                for(var prod in models) {
                  totalPrice += prod.harga!;
                }
                Get.to(keranjang_transactionState(produk: models, harga: totalPrice)
               ,transition: Transition.rightToLeft );
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
  
  Future<int?> showQtyDialog(BuildContext context, int oldValue) async {
    TextEditingController textController =
        TextEditingController(text: '$oldValue');
    int? enteredQty;

    // Tampilkan dialog
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Jumlah Produk"),
          content: TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration:
                const InputDecoration(hintText: "Masukkan Jumlah Produk"),
            maxLines: 1,
          ),
          actions: <Widget>[
            // Tombol Batal
            TextButton(
              onPressed: () {
                enteredQty = -1;
                Navigator.of(context)
                    .pop(null); // Tutup dialog tanpa mengembalikan data
              },
              child: const Text("Batal"),
            ),
            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                // cek apakah jumlah kosong
                if (textController.text.trim().isEmpty) {
                  Get.snackbar('Error', 'Jumlah tidak boleh kosong');
                  return;
                }
                // get jumlah
                int val = int.parse(textController.text);
                // cek validasi jumlah
                if (val <= 0) {
                  Get.snackbar('Error', 'Jumlah minimal 1');
                  return;
                } else if (val > 99) {
                  Get.snackbar('Error', 'Jumlah maksimal 99');
                  return;
                }

                // update jumlah
                enteredQty = val;
                Get.back();
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );

    return enteredQty;
  }
}