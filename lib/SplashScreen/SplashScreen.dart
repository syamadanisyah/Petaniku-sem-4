import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/User/session_user.dart';
import 'package:petaniku2/page/design_dashboard.dart';
import 'package:petaniku2/page/design_login.dart';
import 'package:petaniku2/page/navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async { 
      await Future.delayed(const Duration(seconds: 5));
      _cekLogin();

    });
  }

  
_cekLogin() async{
  bool isLogin = await PetanikuService.isLoggedIn();

  if(isLogin){
    Get.to(design_dashboard(), transition: Transition.downToUp,);
  }else{
    Get.to(design_login(), transition: Transition.downToUp,);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset('assets/images/splashscreen.png',
          fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
