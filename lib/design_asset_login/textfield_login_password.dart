import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class textfield_login_password extends StatelessWidget {

final String?hint;
const textfield_login_password({this.hint});
  @override
  Widget build(BuildContext context) {
    // bool obscureText = true;
    return dinamis_password(hint: hint);


  }
}

class dinamis_password extends StatefulWidget {
  
final String? hint;

const dinamis_password({this.hint});




  @override
  State<dinamis_password> createState() => _dinamis_passwordState();
}

class _dinamis_passwordState extends State<dinamis_password> {
bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
     child: TextField(
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