import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class textfield_login_password extends StatelessWidget {

final TextEditingController PController;
final String?hint;

const textfield_login_password({this.hint,
required this.PController
});



  @override
  Widget build(BuildContext context) {
    // bool obscureText = true;
    return dinamis_password(hint: hint,
    controller: PController,
    );


  }
}

class dinamis_password extends StatefulWidget {
  
final String? hint;

final TextEditingController controller;

const dinamis_password({this.hint,
required this.controller
});




  @override
  State<dinamis_password> createState() => _dinamis_passwordState(controlDinamis: controller);
}

class _dinamis_passwordState extends State<dinamis_password> {

final TextEditingController controlDinamis;

_dinamis_passwordState({
required this.controlDinamis
});


bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
     child: TextField(
      controller: controlDinamis,
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: GoogleFonts.urbanist(),
        decoration: InputDecoration(
          labelText: "Masukan Password",
          labelStyle: GoogleFonts.urbanist(
            textStyle: TextStyle(color: warna.hijau,
            fontWeight: FontWeight.w600)
            ),
          prefixIcon: const Icon(Icons.lock, color: warna.hijau),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: obscureText
                ? const Icon(Icons.visibility_off, color: Colors.grey)
                : const Icon(Icons.visibility, color: Color(0xFF4FBF26)),
          ),
          fillColor: warna.abu_abu,
          filled: true,
          hintText: widget.hint ?? '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
        ),
      ),
    );
  }
}