import 'package:get/get.dart';

import '../animal_controller.dart';


class MusicBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AnimalController());
  }

}