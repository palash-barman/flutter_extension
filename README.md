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
```

## Example Custom Widgets Usage

This section shows how to use **CustomImage** and **CustomButton** widgets in your Flutter project.

```dart
// Example of CustomImage usage
const CustomImage(
  image: "slslsls",
  height: 100,
  width: 200,
),
const SizedBox(height: 20),

// Example of CustomButton usage
CustomButton(
  onTap: () {},
  text: "Click Me",
  loading : true or false
),

```


## Example API Integration Usage

This section shows how to use **Api Integration** in your Flutter project.

```dart
class HomeController extends GetxController {
  var isLoading = false.obs;
  create() async {
    isLoading.value = true;
    var body={"key": "value"};

    var response = await ApiClient.postData(
      "API End Point",
      body,
    );

    if (response.statusCode == 201) {
      debugPrint("success");
    } else {
      ApiChecker.checkApi(response);
      debugPrint("failed");
    }
    isLoading.value = false;
  }
}
```



