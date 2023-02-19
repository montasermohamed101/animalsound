import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/cartoon_animal_model.dart';

class AnimalController extends GetxController{
  List<MonMoni>? animalList;
  AudioPlayer audioPlayer = AudioPlayer();
  final player = AudioCache();
  var isSearch = false.obs;
  RxList searchItems = [].obs;
  var isDark = false;
  var isReal = false;
  var isDarkMode = false;
  late SharedPreferences prefs;
  @override
  void onInit() async{
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    animalList = MonMoni.soundojis.where((element) => element.category == "Animals").toList();
    LoadedDarkMode();
    LoadedisReal();
  }
  play(int index) async {

        player.play(animalList![index].soundPath);
  }




  LoadedDarkMode() async {
    isDark = prefs.getBool('isDark')!;
    update();
  }
  LoadedisReal() async {
    isReal = prefs.getBool('isReal')!;
    update();
  }

  saveDarkMode(isDark) async {
    isDark = await prefs.setBool('isDark', isDark);
    update();
  }
  saveisReal(isReal) async {
    isReal = await prefs.setBool('isReal', isReal);
    update();
  }
}