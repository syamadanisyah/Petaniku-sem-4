import 'package:flutter/material.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:petaniku2/warna/stylefont.dart';
class search_kategori extends StatefulWidget {
  const search_kategori({super.key,
  required this.controller,
  required this.onSubmitted,
  
  });

final TextEditingController controller;
  final Function(String) onSubmitted;


  @override
  State<search_kategori> createState() => _search_kategoriState();
}

class _search_kategoriState extends State<search_kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          width: 340,
          child: TextField(
            controller: widget.controller,
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
            onSubmitted: widget.onSubmitted,
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
    );
  }
}