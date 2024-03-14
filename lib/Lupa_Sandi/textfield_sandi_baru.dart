import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';


class textfield_sandi_baru extends StatefulWidget {
 
 final String? hint;

 textfield_sandi_baru(this.hint);

  @override
  State<textfield_sandi_baru> createState() => _textfield_sandi_baruState(hint);
}

class _textfield_sandi_baruState extends State<textfield_sandi_baru> {

final String? hint;

 _textfield_sandi_baruState(this.hint);

  @override
  Widget build(BuildContext context) {

  

   bool obscureText = true;

    return TextField(
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: GoogleFonts.urbanist(),
        decoration: InputDecoration(
          labelText: "Masukan Sandi Baru",
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
          hintText: hint ?? '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
        ),
      );
  }
}