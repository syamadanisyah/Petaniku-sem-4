import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
class scroll_horizontal_produk extends StatelessWidget {
  const scroll_horizontal_produk({super.key});

  @override
  Widget build(BuildContext context) {
    return scroll_horizontal_produk_dinamis();
  }
}

class scroll_horizontal_produk_dinamis extends StatefulWidget {
  const scroll_horizontal_produk_dinamis({
    super.key,
  });

  @override
  State<scroll_horizontal_produk_dinamis> createState() => _scroll_horizontal_produk_dinamisState();
}

class _scroll_horizontal_produk_dinamisState extends State<scroll_horizontal_produk_dinamis> {  
  @override
  Widget build(BuildContext context) {

final MediaqueryHeight = MediaQuery.of(context).size.height;
final mediaquerywidth = MediaQuery.of(context).size.width;

    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(
          width: 13,
          height: MediaqueryHeight,
        );
      },
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container( 
                   
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 206, 203, 203),
            borderRadius: BorderRadius.circular(10)
          ),
           width: MediaQuery.of(context).size.width*0.5,
           
             
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: warna.abu_abu_hitam
                  ),
                  alignment: Alignment.center,
                  child: Text("Slot $index",),
                ),
                 SizedBox(height: 50,),
                 Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Nama Produk",
                  style: stylefont().body_gridview,),
                 ),
                 SizedBox(height: 10,),
                  Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Rp.56.000",
                  style: stylefont().body_gridview,),
                 ),
                 SizedBox(height:40,),
                  Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Diskripsi",
                  style: stylefont().diskripsi_gridview_barang,),
                 ),
               ],
             ),
           ),

        );
      },
    );
  }
}