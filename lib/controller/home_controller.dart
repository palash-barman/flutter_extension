import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController  implements GetxService{

  String title="Home Screen";

  @override
  void onInit() {

    debugPrint("On Init  $title");

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    debugPrint("On onReady  $title");
    super.onReady();
  }
}