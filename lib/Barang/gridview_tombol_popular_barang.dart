import 'package:flutter/material.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class gridview_tombol_barang extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: () {
                
              }, child: Column(
                 children: [
                  Text("Nama kategori",
                  style: TextStyle(color: Colors.black),),
                  SizedBox(height:15),
                  Text("1000 Produk",
                  style: TextStyle(color: Colors.black),),
                 ],
              ),
              style: ElevatedButton.styleFrom(
                
                backgroundColor: warna.abu_abu_putih,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 7,
                minimumSize: Size(70, 70)
              ),
              ),
              SizedBox(width: 25,),
              
              ElevatedButton(onPressed: () {
                
              }, child: Column(
                 children: [
                  Text("Nama kategori",
                  style: TextStyle(color: Colors.black),),
                  SizedBox(height:20),
                  Text("1000 Produk",
                  style: TextStyle(color: Colors.black),),
                 ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: warna.abu_abu_putih,
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 7,
                 minimumSize: Size(70, 70)
              ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                
              }, child: Column(
                 children: [
                  Text("Nama kategori",
                  style: TextStyle(color: Colors.black),),
                  SizedBox(height:20),
                  Text("1000 Produk",
                  style: TextStyle(color: Colors.black),),
                 ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: warna.abu_abu_putih,
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 7,
                 minimumSize: Size(70, 70)
              ),
              ),
              SizedBox(width: 25,),
      
              ElevatedButton(onPressed: () {
                
              }, child: Column(
                 children: [
                  Text("Nama kategori",
                  style: TextStyle(color: Colors.black),),
                  SizedBox(height:20),
                  Text("1000 Produk",
                  style: TextStyle(color: Colors.black),),
                 ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: warna.abu_abu_putih,
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 7,
                 minimumSize: Size(70, 70)
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}