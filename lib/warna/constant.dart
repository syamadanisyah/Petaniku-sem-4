import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetaniKuConstant{


static Uri baseUrl(url){
  Uri server = Uri.parse('https://petaniku.tifnganjuk.com/api/mobileapi/'+url);
  // Uri server = Uri.parse('https://petaniku.tifnganjuk.com/api/mobileapi/'+url);
  
  return server;
} 

static showLoading({ 
  bool canPop = false,
  Color loadingColor = Colors.green,

}) {
  Get.dialog(
    PopScope(
      canPop: canPop,
      child: Center(
        child: CircularProgressIndicator(
          color: loadingColor,
        ),
      ),
    ),
    barrierDismissible: true,
    transitionCurve: Curves.easeOut,
  );
}


}