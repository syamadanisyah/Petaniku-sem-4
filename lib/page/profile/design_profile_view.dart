import 'package:flutter/material.dart';
import 'package:petaniku2/page/profile/profile_edit.dart';
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
        title: Row(
          children: [
            Container(
              child: Text("Informasi Akun"),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('setting'),
                value: 'setting',
              ),
              PopupMenuItem(
                child: Text('about app'),
                value: 'about',
              ),
              PopupMenuItem(
                child: Text('Logout'),
                value: 'Logout',
              ),
            ];
          },
          onSelected: (String value) {
            switch (value) {
              case'setting':
              Navigator.push(context,MaterialPageRoute(builder: (context) => profile_edit(),
              ),
              );
              break;
              case'about':
              // Navigator.push(context,MaterialPageRoute(builder: (context) => profile_edit(),
              // ),
              // );
              break;
              case'Logout':
              // Navigator.push(context,MaterialPageRoute(builder: (context) => profile_edit(),
              // ),
              // );
              break;

            }
          },
          ),
        ],
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
                      child: Text(
  "Username", // Replace with your phone number variable
  style: TextStyle(fontSize: 20, color: warna.warna_Lupa_password),
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
                      child: Text(
  "Nama", // Replace with your phone number variable
  style: TextStyle(fontSize: 20, color: warna.warna_Lupa_password),
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
                      child: Text(
  "Email", // Replace with your phone number variable
  style: TextStyle(fontSize: 20, color: warna.warna_Lupa_password),
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
                      child: Text(
  "Nomer", // Replace with your phone number variable
  style: TextStyle(
    fontSize: 20, color: warna.warna_Lupa_password,
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
                      child:Text(
  "alamat", // Replace with your actual address variable
  maxLines: null,
  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
  style: TextStyle(fontSize: 20, color: warna.warna_Lupa_password),
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