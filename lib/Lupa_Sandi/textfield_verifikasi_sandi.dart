import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petaniku2/warna/warna.dart';

class textfield_verifikasi_sandi extends StatefulWidget {
  

  final String hint;
   TextEditingController controller = TextEditingController();

  textfield_verifikasi_sandi(this.hint, this.controller);




  @override
  State<textfield_verifikasi_sandi> createState() => _textfield_verifikasi_sandiState(hint, controller);
}


class _textfield_verifikasi_sandiState extends State<textfield_verifikasi_sandi> {

final String hint;
TextEditingController controller = TextEditingController();

_textfield_verifikasi_sandiState(this.hint, this.controller);

  @override
  Widget build(BuildContext context) {

bool obscureText = true;

    return  TextField(
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: GoogleFonts.urbanist(),
        onChanged: (value) {
          widget.controller.text = value;
        },
        decoration: InputDecoration(
          labelText: "Masukan verifikasi sandi baru",
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
      );
  }
}