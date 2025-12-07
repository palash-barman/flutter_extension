import 'package:get/get.dart';

import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String homeScreen="/home_screen";

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
  

  ];



}