import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return search_dinamis();
  }
}

class search_dinamis extends StatefulWidget {
  const search_dinamis({
    super.key,
  });

  @override
  State<search_dinamis> createState() => _search_dinamisState();
}

class _search_dinamisState extends State<search_dinamis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          width: 340,
          child: TextField(
            
            decoration:InputDecoration(
              
              contentPadding: EdgeInsets.all(10),
              fillColor: warna.warna_searching,
              filled: true,
              
              suffixIcon: Icon(Icons.search,),
              hintText: 'Pencarian',
              hintStyle: stylefont().diskripsi_gridview_barang,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none
              ),

              
            ),
            
          ),
        ),
      ),
    );
  }
}