import 'package:animalsounds/theme/theme_services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animal_controller.dart';
import 'Pages/home_screen.dart';
import 'locale/locale.dart';
import 'locale/locale_controller.dart';
SharedPreferences? shared;
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  shared = await SharedPreferences.getInstance();
  shared!.getBool('isRight');

  await GetStorage.init();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Soundoji());
}

class Soundoji extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> AnimalController());
    MyLocaleController lang = Get.put(MyLocaleController());
    return GetMaterialApp(
      builder: (context, child) {
        return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, child!),
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ],
            breakpointsLandscape: [
              const ResponsiveBreakpoint.resize(560, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
              const ResponsiveBreakpoint.resize(1024, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1120,
                  name: TABLET),
            ]);
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      locale: lang.initLang,
      translations: MyLocale(),
      home: AnimatedSplashScreen(
          splash: Column(
            children: [
              Expanded(
                child: Container(
                  child: Lottie.asset("assets/splash.json",
                    animate: true,
                  ),
                ),
              ),
            ],
          ),
          splashIconSize: 500,
          nextScreen: HomeScreen()),

    );
  }
}
