import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animal_controller.dart';




AnimalController controller = Get.put(AnimalController());

Widget buildContainerHome({
  required String title,
  required Icon icon,
}){
  return Container(
    margin: const EdgeInsets.all(10),
    height: 50.0,
    width: 150.0,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          offset: Offset(0.0, 20.0),
          blurRadius: 30.0,
        ),
      ],
      color: controller.isDark  == true ? Colors.black :Colors.yellow.withOpacity(0.5),
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.0,
          width: 190.0,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              topLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
          ),
          child: Center(
            child:Text(title,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),)  ,
          ),
        ),
        icon,
        const SizedBox(width: 10,),
      ],
    ),
  );
}