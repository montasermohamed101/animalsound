import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';


import '../locale/locale_controller.dart';
import '../theme/theme_services.dart';
import 'animal_controller.dart';
import 'home_container.dart';

AnimalController controller = Get.put(AnimalController());
MyLocaleController lang = Get.put(MyLocaleController());

Widget myDrawer() {
  return Drawer(
    child: ListView(
      physics: BouncingScrollPhysics(),
      children: [

        GetBuilder<AnimalController>(
            builder: (controller) => InkWell(
              onTap: () {
                // if(controller.isDark == false){
                //   controller.isDark = !controller.isDark;
                //   // controller.saveDarkMode(controller.isDark.value);
                // }else{
                //   controller.isDark = false;
                // }
                controller.isDarkMode =
                    controller.isDark = !controller.isDark;
                // controller.prefs.setBool('isDark', controller.isDark);
                controller.saveDarkMode(controller.isDark);
                controller.update();
                ThemeService().changeTheme();
              },
              child: buildContainerHome(
                title: controller.isDark ? '7'.tr : '8'.tr,
                icon: controller.isDark
                    ? const Icon(
                  Icons.dark_mode_outlined,
                  size: 30,
                  color: Colors.white,
                )
                    : const Icon(
                  Icons.light_mode_outlined,
                  size: 30,
                ),
              ),
            )),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                  onPressed: () {
                    lang.changeLang('ar');
                    lang.textchange();
                    Get.back();
                  },
                  child: Text('2'.tr)),
            ),
            PopupMenuItem(
              child: TextButton(
                  onPressed: () {
                    lang.changeLang('en');
                    lang.textchange();
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('3'.tr),
                      Image.network('https://img.freepik.com/free-vector/usa-national-flying-flag-with-stars-stripes-realistic_1284-33146.jpg?size=626&ext=jpg&ga=GA1.2.1394827377.1675424689&semt=sph',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  )),
            ),
            PopupMenuItem(
              child: TextButton(
                  onPressed: () {
                    lang.changeLang('ger');
                    lang.textchange();
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text('4'.tr),
                      Image.network('https://img.freepik.com/free-photo/flags-germany_1232-3061.jpg?size=626&ext=jpg&ga=GA1.2.1394827377.1675424689&semt=sph',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    ),
  );
}
