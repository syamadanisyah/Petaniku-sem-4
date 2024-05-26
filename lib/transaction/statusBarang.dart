import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class tapBarStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    konfirmasi(),
    // HomePage(),
    Dikirim(),
    Diterima(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Status Barang'),
          bottom: TabBar(
           
            tabs: [
              Tab(text: 'Tunggu Konfirmasi',),
              // Tab(text: 'diproses',),
              Tab(text: 'dikirim',),
              Tab(text: 'diterima',),
            ],
          ),
        ),
        body: TabBarView(children: _pages),
      ),
    );
  }
}

class konfirmasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Container(
          width: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            
            color: warna.abu_abu_hitam
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               children: [
      
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                        Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                        Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                   ],
                 ),
               ],
             ),
             SizedBox(
              height: 5,
             ),
             Align(
              alignment: Alignment.bottomRight,
               child: Column(

                 children: [
                   Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Text("Total Harga:"),
                   ),
                   SizedBox(
                    height: 5,
                   ),
                   Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Text("Rp 36000"),
                   ),
                 ],
               ),
             ),
            ],
            ),
        );
      },),
    );
  }
}

/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Di prosess'),
    );
  }
}
*/

class Dikirim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Container(
          width: 100,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            
            color: warna.abu_abu_hitam
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               children: [
                Container(
                  margin: EdgeInsets.only(left: 13,top: 10),
                  height: 70,
                  width: 90,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  color: Colors.amber
                  ),
                  child: Center(
                    child: Text("Gambar"),
                  ),
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                        Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                        Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                   ],
                 ),
               ],
             ),
             SizedBox(
              height: 5,
             ),
             Container(
              margin: EdgeInsets.only(left: 14),
              child: Text("Total Harga:"),
             ),
             SizedBox(
              height: 5,
             ),
             Row(
               children: [
                 Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Text("Rp 36000"),
                 ),
                  SizedBox(width: 135,),
                 Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(105,30)),
                       backgroundColor: MaterialStatePropertyAll(warna.hijau)
                    ),
                    onPressed: () {
                    
                  }, child: Text(
                    "Terima",
                    style: stylefont().buton_kategori_barang,
                    )
                  ),
                 ),
               ],
             ),
            ],
            ),
        );
      },),
    );
  }
}

class Diterima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            
            color: warna.abu_abu_hitam
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               children: [
                Container(
                  margin: EdgeInsets.only(left: 13,top: 10),
                  height: 70,
                  width: 90,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  color: Colors.amber
                  ),
                  child: Center(
                    child: Text("Gambar"),
                  ),
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Pupuk UREA"),
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("3 Barang"),
                     ),
                   ],
                 ),
               ],
             ),
             SizedBox(
              height: 5,
             ),
             Row(
               children: [
                 Column(
                   children: [
                     Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Text("Total Harga:"),
                     ),
                     SizedBox(
                      height: 5,
                     ),
                     Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Text("Rp 36000"),
                     ),
                   ],
                 ),
                
               ],
             ),
            ],
            ),
        );
      },),
    );
  }
}
