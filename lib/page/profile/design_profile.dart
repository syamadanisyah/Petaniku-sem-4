import 'package:flutter/material.dart';

class design_profile extends StatefulWidget {
  const design_profile({super.key});

  @override
  State<design_profile> createState() => _design_profileState();
}

class _design_profileState extends State<design_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Column(
      children: [
        Container(
          child: CircleAvatar(),
        )
      ],
    ),

    );
  }
}