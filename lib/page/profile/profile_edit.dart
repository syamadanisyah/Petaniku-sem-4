import 'package:flutter/material.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class profile_edit extends StatefulWidget {
  const profile_edit({super.key});

  @override
  State<profile_edit> createState() => __profileSettingState();
}

class __profileSettingState extends State<profile_edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Edit akun'),),

      body: Center(
        child: Column(
          children: [
            
          Container(
              child: CircleAvatar(
                radius: 54,
              ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 40,
            child: ElevatedButton(
            onPressed: () {
            
          }, child: Row(
            children: [
              Icon(Icons.settings,color: warna.hijau,),
              Text("Edit akun",style: stylefont().diskripsi_gridview_barang,)
            ],
          ),
          ),
          ),
       
               SizedBox(
            height: 10,
          ),

          Container(
            width: 250,
            height: 40,
            child: ElevatedButton(onPressed: () {
              
            }, child: Row(
              children: [
                Icon(Icons.adb_rounded,color: warna.hijau,),
                Text("About App ",style: stylefont().diskripsi_gridview_barang,)
              ],
            ),),
          ),
             SizedBox(
            height: 10,
          ),
          
          Container(
            width: 250,
            height: 40,
            child: ElevatedButton(onPressed: () {
              
            }, child: Row(
              children: [
                Icon(Icons.logout,color: warna.hijau,),
                Text("Logout",style: stylefont().diskripsi_gridview_barang,)
              ],
            ),),
          ),
        
          ],
        ),
      ),
    );
  }
}