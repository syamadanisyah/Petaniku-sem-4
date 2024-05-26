import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class curosel_slder_image extends StatefulWidget {
  const curosel_slder_image({super.key});

  @override
  State<curosel_slder_image> createState() => __curosel_slder_imagStateState();
}

class __curosel_slder_imagStateState extends State<curosel_slder_image> {

int _current = 0;
final CarouselController crs = CarouselController();

 
  final List<Widget> containerList = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("curosel_slider"),
      ),
         body: Container(
          height: 200,
          width: 400,
          color: Colors.amber,
         child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: containerList,
                 options: CarouselOptions(
                  height: 300,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                 ),
                 carouselController: crs,
                 ),
              ),

              
              Padding(
                padding: EdgeInsets.all(8),
                child: AnimatedSmoothIndicator(
                  activeIndex: _current,
                   count: containerList.length,
                   effect: ScrollingDotsEffect(
                    activeDotColor: warna.hijau,
                    dotColor: Colors.grey,
                    dotHeight: 12,
                    dotWidth: 12,
                   ),
                   ),
                 )
               
          ],
         ),
         ),      
    );
  }
}