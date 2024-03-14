import 'package:flutter/material.dart';
import 'package:petaniku2/search/search.dart';
import 'package:petaniku2/warna/stylefont.dart';

class design_search extends StatefulWidget {
  const design_search({super.key});

  @override
  State<design_search> createState() => _design_searchingState();
}

class _design_searchingState extends State<design_search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                color: Colors.amber,
                height: 60,
                width: 380,
                child: search()
                ),
                 SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                 // color: Colors.amber,
                 alignment: Alignment.topLeft,
                  height: 60,
                   child: Text("Pencarian Terakhir",
                   style: stylefont().Subheader,),
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}