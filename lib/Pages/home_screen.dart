
import 'package:animalsounds/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/my_json.dart';
import '../Constants/my_string.dart';
import '../ads/banner_ad_model.dart';
import '../animal_controller.dart';
import '../home_container.dart';
import '../locale/locale_controller.dart';
import '../my_drawer.dart';
import 'animal_voice_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  MyLocaleController lang = Get.put(MyLocaleController());
  AnimalController controller = Get.put(AnimalController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('1'.tr),
        actions: [
          GetBuilder<AnimalController>(
              builder: (controller) => InkWell(
                onTap: () {
                  controller.isDarkMode =
                      controller.isDark = !controller.isDark;
                  controller.saveDarkMode(controller.isDark);
                  controller.update();
                  ThemeService().changeTheme();
                },
                child: controller.isDark
                    ? const Icon(
                  Icons.dark_mode_outlined,
                  size: 30,
                  // color: Colors.white,
                )
                    : const Icon(
                  Icons.light_mode_outlined,
                  size: 30,
                ),
              )),
          SizedBox(width: 20,),
          DropdownButton<String>(
              underline: const Text(''),
              icon: Icon(Icons.language_outlined,color: controller.isDark ? Colors.black : Colors.white,),
              hint: Text('65'.tr,style: Theme.of(context).textTheme.bodyLarge,),
              items: myJson.map((items) {
                return DropdownMenuItem<String>(
                  value: items['id'],
                  child: Row(
                    children: [
                      SvgPicture.asset('${items['image']}',
                        height: 30,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(items['id']),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                lang.changeLang(value!);
              }),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('${ controller.isDark ? myHomeImageLight : myHomeImageDark}'),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddBanner(),
              Container(
                child: Lottie.asset("assets/splash.json",
                  animate: true,
                  height: 200,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child:    ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   // backgroundColor: Colors.red,
                   minimumSize: Size(20, 50),
                   padding: const EdgeInsets.symmetric(
                       vertical: 10, horizontal: 30),
                 ),
                 onPressed: () {
                   Get.to(AnimalVoiceScreen());
                 },
                 child: FittedBox(child: Text('66'.tr,style: Theme.of(context).textTheme.bodyLarge,maxLines: 2,)),
               ),),
                  const SizedBox(width: 20,),
                  Expanded(child:    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.red,
                      minimumSize: Size(20, 50),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                    ),
                    onPressed: () {
                      launchUrl(
                          Uri.parse('https://sites.google.com/view/monmoni'));
                    },
                    child: FittedBox(child: Text('67'.tr,style: Theme.of(context).textTheme.bodyLarge)),

                  ),),
                ], 
              ),
              const SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.red,
                      minimumSize: Size(20, 50),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                    ),
                    onPressed: () {
                      launchUrl(
                          Uri.parse('https://play.google.com/store/apps/developer?id=MonMoniApps'));
                    },
                    child: Text('68'.tr,style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
