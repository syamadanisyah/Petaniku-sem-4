import 'package:flutter/material.dart';
import 'package:petaniku2/populer/gridview_barangPopuler.dart';
import 'package:petaniku2/search/search.dart';
import 'package:petaniku2/warna/stylefont.dart';

class design_unit_kategoriPopuler extends StatefulWidget {
  const design_unit_kategoriPopuler({super.key, required this.jeneng});

  final String jeneng;

  @override
  State<design_unit_kategoriPopuler> createState() =>
      _design_unit_kategoriPopulerState();
}

class _design_unit_kategoriPopulerState
    extends State<design_unit_kategoriPopuler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                height: 60,
                child: Text(
                  "Cari Produk sesuai keinginanmu",
                  style: stylefont().Subheader,
                ),
              ),
              // Container(
              //   child: search(),
              // ),
              SizedBox(
                height: 40,
              ),
              Container(
                // color: Colors.amber,
                height: null,
                padding: EdgeInsets.all(10),
                child: gridview_barang_populer(jeneng: widget.jeneng,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
