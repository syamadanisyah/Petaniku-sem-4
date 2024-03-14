import 'package:flutter/material.dart';
import 'package:petaniku2/Kategori/listview_kategori.dart';
import 'package:petaniku2/Kategori/search_kategori.dart';

class design_list_kategori extends StatefulWidget {
  const design_list_kategori({super.key});

  @override
  State<design_list_kategori> createState() => _design_list_kategoriState();
}

class _design_list_kategoriState extends State<design_list_kategori> {

    


  @override
  Widget build(BuildContext context) {
   
   final mediaquerywidth = MediaQuery.of(context).size.width;
   final mediaqueryheigh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Container(
              //color: Colors.amber,
              width: 390,
              height: 60,
             child: search_kategori(),
            ),
            Container(
              height: 200,
              width: 395,
              child: listview_kategori(),
        
              ),
        
          ],
        ),
      ),
    );
  }
}