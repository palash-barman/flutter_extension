import 'package:flutter/material.dart';
import 'package:flutter_extension/theme/dark_theme.dart';
import 'package:flutter_extension/theme/light_theme.dart';
import 'package:flutter_extension/util/app_constants.dart';
import 'package:flutter_extension/util/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'controller/localization_controller.dart';
import 'controller/theme_controller.dart';
import 'helper/get_di.dart' as di;
import 'helper/route_helper.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await di.init();
  runApp( MyApp(languages:_languages,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return  GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_ , child) {
            return GetMaterialApp(
              title: AppConstants.APP_NAME,
              debugShowCheckedModeBanner: false,
              navigatorKey: Get.key,
              theme: themeController.darkTheme ?  dark() : light(),
              defaultTransition: Transition.topLevel,
              locale: localizeController.locale,
              translations: Messages(languages: languages),
              fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
              transitionDuration: const Duration(milliseconds: 500),
              getPages: AppRoutes.page,
              initialRoute: AppRoutes.homeScreen,
            );
          }
        );
      }
    );

    }
    );

  }

}


