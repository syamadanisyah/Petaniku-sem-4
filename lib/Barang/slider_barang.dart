import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class slider_barang extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:slider_dinamis()
      ),
    );
  }
}

class slider_dinamis extends StatefulWidget {


  @override
  State<slider_dinamis> createState() => _slider_dinamisState();
}

class _slider_dinamisState extends State<slider_dinamis> {
  @override
  Widget build(BuildContext context) {


final MediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
      child:CarouselSlider(items: [1,2,3,4,5].map((e) {
        return Container(
          width: 300,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text("text $e",style: TextStyle(fontSize: 40),),
          ),
        );
      }).toList(), options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        height: 300,
        onPageChanged: (index, reason) {
          
        },
        )
        )
    );
  }
}