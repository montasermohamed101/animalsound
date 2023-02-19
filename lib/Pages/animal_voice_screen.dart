
import 'package:animalsounds/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../Constants/my_json.dart';
import '../Constants/my_string.dart';
import '../ads/banner_ad_model.dart';
import '../ads/interstitial_ad_model.dart';
import '../animal_controller.dart';
import '../my_drawer.dart';


class AnimalVoiceScreen extends StatelessWidget {
  AnimalVoiceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AnimalController>(
        init: AnimalController(),
        builder:(controller) => SafeArea(
          child: Container(
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${ controller.isDark ? myHomeImageLight : myHomeImageDark}'),
                    fit: BoxFit.cover
                )
            ),
            child:  Column(
              children: [
                AddBanner(),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                    GetBuilder<AnimalController>(
                        builder: (controller) => InkWell(
                          onTap: () {
                            controller.isDarkMode = controller.isDark = !controller.isDark;
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

                  ],
                ),
                Expanded(child:   GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        childAspectRatio: 10 / 10,
                        crossAxisSpacing: 50,
                        mainAxisSpacing: 50),
                    itemCount: controller.animalList!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            AdInterstitialTop.loadIntersitialAd();
                            AdInterstitialTop.showInterstitialAd();
                            // controller.player.play(controller.animalList![index].soundPath);
                            controller.play(index);
                          },
                          child: Center(
                            child: Column(
                              children: [
                                 Image.asset('${controller.animalList![index].iconPath}',
                                  height: 200,
                                  width: 200,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child:
                                     FittedBox(child: Text('${controller.animalList![index].title.tr}',style: Theme.of(context).textTheme.bodyLarge,))) ,
                              ], 
                            ),
                          ),
                        ),
                      );
                    }),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
