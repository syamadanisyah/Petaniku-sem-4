import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/design_asset_login/test_asset_login.dart';
import 'package:petaniku2/design_asset_login/textButton_lupa_psw.dart';
import 'package:petaniku2/design_asset_login/textButton_regis.dart';
import 'package:petaniku2/design_asset_login/textfield_login.dart';
import 'package:petaniku2/design_asset_login/textfield_login_password.dart';
import 'package:petaniku2/warna/stylefont.dart';


class test_asset_login extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 106,),
            //textfield_login_email(),
            SizedBox(height: 30,),
          //  textfield_login_password(),
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: textbutton_login_LP()
              ),

              Container(
                
                child: textButton_registrasi() ,
              ),
              
              SizedBox(height: 20),
              SizedBox(
                width: 500,
                child: TextField(
                 // controller: _usernameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Username',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 500,
                child: TextField(
                //  controller: _passwordController,
                 // obscureText: isHidden,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Password',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                   /* suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                        //  isHidden = !isHidden;
                        });
                      },
                     // icon: isHidden ? Icon(Icons.visibility_off, color: Colors.black) : Icon(Icons.visibility, color: Colors.black),
                    ),*/
                  ),
                ),
              ),
             
          ],
        ),
      ),
    );
  }
}