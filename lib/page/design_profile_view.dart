import 'package:flutter/material.dart';
import 'package:petaniku2/warna/warna.dart';

class design_profile_view extends StatefulWidget {
  const design_profile_view({super.key});

  @override
  State<design_profile_view> createState() => _design_profile_viewState();
}

class _design_profile_viewState extends State<design_profile_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text("Informasi Akun"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
            Container(
              child: CircleAvatar(
                radius: 54,

              ),
            ),
            SizedBox(height: 60,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.account_box,color: warna.hijau,size: 40,
                    ),
                    ),
                    Container(
                     // color: Colors.amber,
                      height: 40,
                      width: 200,
                      child: TextField(
                        
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle:  TextStyle(fontSize: 20,color: warna.warna_Lupa_password),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                        ),
                      ),
                    ),
              ],
             ),
               Container(
                color: warna.warna_Lupa_password,
                height: 2,
                //width: 200,
               ),
               SizedBox(height: 30,), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.check_box,color: warna.hijau,size: 40,
                    ),
                    ),
                    Container(
                     // color: Colors.amber,
                      height: 40,
                      width: 200,
                      child: TextField(
                        
                        decoration: InputDecoration(
                          hintText: "Nama",
                          hintStyle:  TextStyle(fontSize: 20,color: warna.warna_Lupa_password),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                        ),
                      ),
                    ),
              ],
             ),
               Container(
                color: warna.warna_Lupa_password,
                height: 2,
                //width: 200,
               ),
               SizedBox(height: 30,), 

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.email_rounded,color: warna.hijau,size: 40,
                    ),
                    ),


                    Container(
                     //color: Colors.amber,
                      height: 40,
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle:  TextStyle(fontSize: 20,color: warna.warna_Lupa_password),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                        ),
                      ),
                    ),
              ],
             ),
               Container(
                color: warna.warna_Lupa_password,
                height: 2,
               // width: 200,
               ),
               SizedBox(
                height: 30,
               ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.phone_android_outlined,color: warna.hijau,size: 40,
                    ),
                    ),
                    Container(
                     // color: Colors.amber,
                      height: 40,
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "No Telp",
                          hintStyle:  TextStyle(fontSize: 20,color: warna.warna_Lupa_password),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                        ),
                      ),
                    ),
              ],
             ),
               Container(
                color: warna.warna_Lupa_password,
                height: 2,
               // width: 200,
               ),

               SizedBox(height: 30,),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.house,color: warna.hijau,size: 40,
                    ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                     // color: Colors.amber,
                     alignment: Alignment.centerLeft,
                      height: 140,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child:TextField(
                       maxLines: null,
                       keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Alamat",
                          hintStyle:  TextStyle(fontSize: 20,color: warna.warna_Lupa_password),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10), 
                          ),
                        ),
                      ),
                    ),
              ],
             ),
              /* Container(
                color: warna.warna_Lupa_password,
                height: 2,
               // width: 200,
               ),*/


            ],
          ),
        ),
      ),
    );
  }
}