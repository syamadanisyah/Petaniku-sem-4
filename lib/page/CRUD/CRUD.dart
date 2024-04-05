import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petaniku2/page/CRUD/ModelKontak.dart';
import 'package:petaniku2/page/CRUD/controller_crud.dart';
import 'package:petaniku2/warna/warna.dart';

class crud extends StatefulWidget {
  const crud({super.key});

  @override
  State<crud> createState() => _crudState();
}

class _crudState extends State<crud> {
  TextEditingController namacon = TextEditingController();
  TextEditingController kontakcon = TextEditingController();
  FirebaseController firecontroller = FirebaseController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Praktik CRUD"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 20,),
            Container(
              height: 50 ,
              width: 380,
              child: TextField(
                controller: namacon,
                decoration: InputDecoration(
                  labelText: "masukan nama",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
                
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50 ,
              width: 380,
              
              child: TextField(
                controller: kontakcon,
                keyboardType: TextInputType.number,
                inputFormatters:<TextInputFormatter> [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "masukan Nomer",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                
              ),
            ),
         SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  final model = KontakModel(
                    name: namacon.text,
                    noTelp: kontakcon.text

                  );
                  try{
                    firecontroller.addStudent(model);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data berhasil di tambahkan")
                    )
                    );
                  }catch(ex){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data gagal di tambahkan")
                    )
                    );
                  }
                }, child: Text("Save",
                style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                 ),
                 backgroundColor: MaterialStateProperty.all<Color>(
                  warna.hijau
                 )
                ),
                ),
                ElevatedButton(onPressed: () {
                  
                }, child: Text("Update",
                style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                 ),
                 backgroundColor: MaterialStateProperty.all<Color>(
                  warna.hijau
                 )
                ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
            //  color: Colors.amber,
              height: 480,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
               // physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Icon(Icons.account_circle,size: 45,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Container(
                            child: Text("Nama Kontak"),
                           ),
                           Container(
                            child: Text("No telp"),
                           ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.edit,size: 30,)
                        ),
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.restore_from_trash_rounded,size: 35,)
                        ),
                      ],
                    ),
                  );
                },
              
              ),
            ),
        
            ],
          ),
        ),
      ),
    );
  }
}