# flutter_extension

A new Flutter project.

## Getting Started

## Theme and Language Switcher Example

This example demonstrates a **theme switcher** and a **language dropdown** in Flutter using `GetX`.

```dart
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
    elevation: 0,
    iconSize: 30,
    underline: const SizedBox(),
    onChanged: (int? index) {
      localizationController.setLanguage(
        Locale(
          AppConstants.languages[index!].languageCode, 
          AppConstants.languages[index].countryCode
        )
      );
    },
  );
}),
const SizedBox(width: 20),

