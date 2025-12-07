import 'package:flutter_extension/helper/route_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {


  jumpNextScreen() {
    // Logic to determine the next screen
    // For example, check if user is logged in
    bool isLoggedIn = true; // Replace with actual login check

    if (isLoggedIn) {
      Get.offNamed(AppRoutes.homeScreen); // Navigate to home screen
    } else {
    //  Get.offNamed('/login'); // Navigate to login screen
    }
  }



}
