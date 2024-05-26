import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/transaction/cart_controller.dart';
import 'package:petaniku2/transaction/design_keranjang1.dart';
import 'package:petaniku2/transaction/design_keranjang_transaction.dart';
import 'package:petaniku2/warna/navbar_produk_scroll_hide.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:provider/provider.dart';

class design_proDet_kategori_populer extends StatefulWidget {


        final modelProduk modelPopuler;


  const design_proDet_kategori_populer({
    
    super.key,
    required this.modelPopuler
    
    });

  @override
  State<design_proDet_kategori_populer> createState() => _design_proDet_kategori_populerState(dataPopulerDet: modelPopuler);
}

class _design_proDet_kategori_populerState extends State<design_proDet_kategori_populer> {
final modelProduk dataPopulerDet;

 _design_proDet_kategori_populerState({
required this.dataPopulerDet

});

  late ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState

    controller = ScrollController();
    
    super.initState();
  }
  @override
  void Dispose() {
    // TODO: implement initState

    controller = ScrollController();

    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
   final mediaquerywidth = MediaQuery.of(context).size.width;
    final mediaqueryheigh = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Container(
                height: 200,
                
                child: Center(
                      child: Text("Gambar"),
                    ),
              ),
              
              Container(
                color: warna.hijau,
                height: 80,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(dataPopulerDet.nama,
                          style: stylefont().body,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("${dataPopulerDet.harga}",
                          style: stylefont().body,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                   SizedBox(
                    height: 20,
                   ),

                   Container(
                    // color: Colors.amber,
                    child: Padding(padding: EdgeInsets.all(8),
                    child: Text(dataPopulerDet.deskripsi,
                    textAlign:TextAlign.justify,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                    style: stylefont().Subheader,

                    ),
                    ),
                   ),
                    
                     SizedBox(
                    height: 60,
                   ),

              Container(
               height: mediaqueryheigh *0.5,
               width: mediaquerywidth *1,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: warna.hijau
               ),
               child: Padding(
                padding: EdgeInsets.all(10),
                // child: ,
                 ),
              )
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
              ElevatedButton(
                onPressed: () async {
                  
                   
                   
                   DMethod.log('id produk : ${widget.modelPopuler.id}');
                  DMethod.log('nama produk : ${widget.modelPopuler.nama}');
                  // int qty = await showQtyDialog(context, 1) ?? 1;

                  // if (qty <= 0) {
                  //   qty = 1;
                  // }

                  // DMethod.log('qty : $qty');

                  final controller = CartController();

                  await controller.addCart(
                    1,
                    widget.modelPopuler.id,
                    widget.modelPopuler.nama,
                    1,
                    widget.modelPopuler.harga.toString(),
                  );

                  Get.to(design_keranjang());
               

                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.amber[600],
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(180, 35)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(),
                  ),
                ),
              ),
              /**
               */
               
              GestureDetector(
                onTap: () async {
                 
                  
                  
                List<modelProduk> models =[widget.modelPopuler];
                int totalPrice = 0;
                for(var prod in models){
                  totalPrice += prod.harga;
                }
                //lanjutan ini untuk besok
                Get.to(
                  keranjang_transactionState(
                    produk: models,
                     harga: totalPrice
                     ),
                     transition:Transition.rightToLeft,
                  );
                
                },
                child: Container(
                  height: 47,
                  width: 200,
                  alignment: Alignment.center,
                  color: warna.hijau,
                  child: Text(
                    "Pesan sekarang",
                    style: stylefont().Subheader_navbar_produk,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}