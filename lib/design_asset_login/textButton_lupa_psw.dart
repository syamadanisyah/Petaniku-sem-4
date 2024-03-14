import 'package:flutter/material.dart';
import 'package:petaniku2/page/Lupa_password/design_lupa_password.dart';
import 'package:petaniku2/warna/warna.dart';

class textbutton_login_LP extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      Route pindah = MaterialPageRoute(
        builder: (context) => design_lupa_password(),
        );
       
       Navigator.push(context,pindah);

    },
    style: ButtonStyle(),
     child: Text("Lupa Password?",
     style:TextStyle(color: warna.warna_Lupa_password),)
     );
  }
}