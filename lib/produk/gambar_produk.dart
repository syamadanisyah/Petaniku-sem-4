import 'package:flutter/material.dart';
import 'package:petaniku2/warna/warna.dart';

class gambar_produk extends StatelessWidget {
  const gambar_produk({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 370,
              width: 400,
              color: warna.hijau,
              child: Image.asset('images/produk1.png',
              fit: BoxFit.cover,),
             );
  }
}