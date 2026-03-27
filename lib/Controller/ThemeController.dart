import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkTheme'; // المفتاح الموحد
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // بنقرأ من الكاش وبنحدث الـ Observable
    isDarkMode.value = _box.read(_key) ?? false;
  }

  ThemeMode initialTheme() {
    // اقرأ من نفس المفتاح اللي بتخزن فيه يا قيصر!
    var isDark = _box.read(_key);

    if (isDark == null) {
      return ThemeMode.system; // لو أول مرة، اتبع الموبايل
    }
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    // 1. غير قيمة الـ Mode في الـ UI
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

    // 2. اعكس القيمة في الـ Observable
    isDarkMode.value = !isDarkMode.value;

    // 3. احفظ القيمة الجديدة في الكاش بـ نفس المفتاح
    _box.write(_key, isDarkMode.value);
  }
}