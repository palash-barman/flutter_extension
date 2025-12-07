import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_extension/controller/localization_controller.dart';
import 'package:flutter_extension/controller/theme_controller.dart';
import 'package:flutter_extension/util/app_constants.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            
            // Theme Switcher
            
            Switch(
              value: Get.find<ThemeController>().darkTheme,
              onChanged: (v) {
                Get.find<ThemeController>().toggleTheme();
              },
            ),
            const SizedBox(height: 20),

            // Language Dropdown  
             GetBuilder<LocalizationController>(builder: (localizationController) {
            int _index = 0;
            List<DropdownMenuItem<int>> _languageList = [];
            for(int index=0; index<AppConstants.languages.length; index++) {
              _languageList.add(DropdownMenuItem(
                value: index,
                child: Text(AppConstants.languages[index].languageName),
              ));
              if(AppConstants.languages[index].languageCode == localizationController.locale.languageCode) {
                _index = index;
              }
            }
            return DropdownButton<int>(
              value: _index,
              items: _languageList,
              dropdownColor: Theme.of(context).cardColor,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 0, iconSize: 30, underline: const SizedBox(),
              onChanged: (int? index) {
                localizationController.setLanguage(Locale(AppConstants.languages[index!].languageCode, AppConstants.languages[index].countryCode));
              },
            );
          }),
          const SizedBox(width: 20),
        
        
        
        
          ],
        ),
      ),
    );
  }
}
