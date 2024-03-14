import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       // Image.asset('asset/image/acara12.png'),
       Container(
      alignment: Alignment.center,
        child: Image.asset('asset/image/splashscreen.png',)
        ),
       
      ],
    );
  }
}