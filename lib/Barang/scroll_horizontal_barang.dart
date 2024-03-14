import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class scroll_horizontal_barang extends StatelessWidget {
  const scroll_horizontal_barang({super.key});

  @override
  Widget build(BuildContext context) {
    return dinamis_horizontal();
  }
}

class dinamis_horizontal extends StatelessWidget {
  

  const dinamis_horizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

final MediaqueryHeight = MediaQuery.of(context).size.height;
final mediaquerywidth = MediaQuery.of(context).size.width;

    return ListView.separated(
      separatorBuilder: (context, index) {
        //layout dasar
        return Container(
          width: 13,
          height: MediaqueryHeight,
        );
      },
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container( 
             //layout untuk penampilan
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