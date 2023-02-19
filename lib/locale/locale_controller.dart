import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';


class MyLocaleController extends GetxController {

  Locale initLang = shared!.getString('lang') == null
      ? Get.deviceLocale! : Locale(shared!.getString('lang')!);

  bool right = false;
  void changeLang(String codelang){
    Locale locale = Locale(codelang);
    // right =!right;
    shared!.setString('lang', codelang);
    Get.updateLocale(locale);
  }
  void saveDir(){
    shared!.setBool('isRight', isRTL);
    update();
  }
  void getDir(){
    shared!.getBool('isRight');
    update();
  }
  // void getRight(){
  //   shared!.get
  // }
  bool isRTL = false;
  textchange(){
    isRTL = !isRTL;
  }


}