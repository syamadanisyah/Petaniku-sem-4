import 'package:flutter/material.dart';
import 'package:petaniku2/Kategori/listview_kategori.dart';

class test_asset_kategori extends StatefulWidget {
  const test_asset_kategori({super.key});

  @override
  State<test_asset_kategori> createState() => _test_asset_kategoriState();
}

class _test_asset_kategoriState extends State<test_asset_kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: 380,
            child: listview_kategori(),
          ),
        ],
      ),
    );
  }
}